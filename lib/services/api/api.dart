import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:gooto/services/app_config.dart';
import 'package:path/path.dart';
import '../helpers/exceptions/ApiException.dart';
import '../helpers/exceptions/FetchDataException.dart';
import '../helpers/exceptions/UnauthorisedException.dart';

class Api {
  static final Api _api = Api._internal();

  final String url = AppConfig.baseUrl;
  // AppConfig.env == Environment.DEV ? AppConfig.baseUrllocal : AppConfig.baseUrl;
  final String path = AppConfig.path;

  String token = "";
  factory Api() {
    return _api;
  }

  Api._internal();

  Future<dynamic> httpPostWithFile(String endPath,
      {File? file, Map<String, String>? body, String fileType = 'avatar'}) async {
    String fileParam = fileType.toString();
    if (body == null) body = {'key': 'empty'};

    if (path != '') endPath = '$path/$endPath';

    var responseJson;

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-type': 'multipart/form-data',
    };
    try {
      Uri uri = Uri.parse("http://${this.url}/$endPath");
      print(uri);
      http.MultipartRequest request = new http.MultipartRequest('POST', uri)
        ..headers.addAll(headers)
        ..fields.addAll(body);

      if (file != null) {
        var length = await file.length();
        request.files.add(
          http.MultipartFile('$fileParam', file.openRead(), length, filename: basename(file.path)),
        );
      }
      var response = await http.Response.fromStream(await request.send());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> httpPost(String endPath, Object body) async {
    print(endPath);

    Uri uri = Uri.https(url, "$path/$endPath", null);
    var responseJson;
    print(uri);
    print("token :: " + token);
    final response = await http.post(uri, body: body, headers: {
      'Authorization': 'Bearer ' + token,
      'Content-type': 'application/json',
      'Accept': '*/*',
    });
    print("response after post" + response.statusCode.toString());
    responseJson = _returnResponse(response);

    return responseJson;
  }

  Future<dynamic> httpPostar(String endPath, Object body) async {
    print(endPath);

    Uri uri = Uri.https(url, "$path/$endPath", null);
    var responseJson;
    print(uri);
    print("token :: " + token);
    try {
      final response = await http.post(uri, body: body, headers: {
        'Authorization': 'Bearer ' + token,
        // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYTQyZWIxZWE3MGY4OWQ3Y2RkMmRlOSIsImlhdCI6MTY2ODQzMTYzOSwiZXhwIjoxNjcxMDIzNjM5fQ.cWrVAQuxA-KqSKVRTIA0EDJ5-1PHgoIOtusmwHzmuco',
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      print("response after post" + response.statusCode.toString());
      responseJson = _returnResponse(response);
    } catch (e) {
      print(e.toString());
    }

    return responseJson;
  }

  Future<dynamic> httpPut(String endPath, Object body) async {
    Uri uri = Uri.https(url, "$path/$endPath", null);
    var responseJson;
    try {
      print("token :: " + token);

      final response = await http.put(uri, body: body, headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> httpDelete(
    String endPath,
  ) async {
    Uri uri = Uri.http(url, "$path/$endPath", null);
    var responseJson;
    print(uri);
    try {
      final response = await http.delete(uri, headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> httpGet(String endPath, {Map<String, String>? query}) async {
    Uri uri = Uri.https(url, "$path/$endPath", null);
    if (query != null) {
      uri = Uri.https(url, "$path/$endPath", query);
    }
    var responseJson;
    print(uri);
    print(token);
    // try {
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );
    responseJson = _returnResponse(response);

    return responseJson;
  }

  Future<dynamic> httpGetNoT(String endPath, {Map<String, String>? query}) async {
    Uri uri = Uri.https(url, "$path/$endPath", null);
    if (query != null) {
      uri = Uri.https(url, "$path/$endPath", query);
    }
    var responseJson;
    print("this is the uri = $uri");
    // try {
    final response = await http.get(
      uri,
      headers: {
        'Content-type': 'application/json',
      },
    );
    responseJson = _returnResponse(response);

    return responseJson;
  }

  Future<dynamic> httpGetCheck(String endPath) async {
    Uri uri = Uri.https(url, "$path/$endPath", null);

    print(uri);
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    return response.statusCode;
  }

  dynamic _returnResponse(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    print('responseJson $responseJson');
    print('response.statusCode ${response.statusCode}');

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        return responseJson;
      case HttpStatus.badRequest:
      case HttpStatus.unprocessableEntity:
        var exception = _parseError(responseJson);
        throw BadRequestException(exception['message'], exception['code'], exception['lang']);
      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:
        var exception = _parseError(responseJson);
        throw UnauthorisedException(exception['message'], exception['code'], exception['lang']);
      case HttpStatus.internalServerError:
      default:
        var exception = _parseError(responseJson);
        throw FetchDataException(exception['message'], exception['code'], exception['lang']);
    }
  }

  HashMap<String, String> _parseError(dynamic responseJson) {
    HashMap<String, String> parsedErrors = HashMap();
    if (responseJson is String) {
      parsedErrors['message'] = responseJson;
      parsedErrors['code'] = '';
      parsedErrors['lang'] = '';
      return parsedErrors;
    }

    parsedErrors['message'] = responseJson['message'].toString();
    parsedErrors['code'] = responseJson['code'].toString();
    parsedErrors['lang'] = responseJson['lang'].toString();
    return parsedErrors;
  }
}
