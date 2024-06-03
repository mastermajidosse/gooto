// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
// import 'package:http_auth/http_auth.dart';

// class PaypalServices {
//   String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
// //  String domain = "api.paypal.com"; // for production mode

// //

//   String secret =
//       "EB-mRNVNgRs-mmrBKQ0k0dvXShOyhvMY1dA2rGQViIuZrJ-smgGQOgWfgEjHKIBvxBkvAbBEmO2G7iHx";
//   String clientId =
//       'ATEs-7cy2f_KInUbiSVckJgCj1A4t2a5i8-xnIJFKnStagnImyqGTT9digR7h8O00fmYhVnmoRgX-euW';

//   Future<String?> getAccessToken() async {
//     try {
//       var client = BasicAuthClient(clientId, secret);
//       var response = await client.post('/v1/oauth2/token?grant_type=client_credentials');
//       print(response.body);
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         final body = convert.jsonDecode(response.body);
//         return body["access_token"];
//       }
//       return null;
//     } catch (e) {
//       print(e.toString());
//       rethrow;
//     }
//   }

//   // for creating the payment request with Paypal
//   Future<Map<String, String>?> createPaypalPayment(
//       transactions, accessToken) async {
//     final _uri = Uri.https(domain, 'v1/payments/payment');
//     try {
//       var response = await http.post(_uri,
//           body: convert.jsonEncode(transactions),
//           headers: {
//             "content-type": "application/json",
//             'Authorization': 'Bearer ' + accessToken
//           });

//       final body = convert.jsonDecode(response.body);

//       if (response.statusCode == 201) {
//         if (body["links"] != null && body["links"].length > 0) {
//           List links = body["links"];

//           String executeUrl = "";
//           String approvalUrl = "";
//           final item = links.firstWhere((o) => o["rel"] == "approval_url",
//               orElse: () => null);
//           if (item != null) {
//             approvalUrl = item["href"];
//           }
//           final item1 = links.firstWhere((o) => o["rel"] == "execute",
//               orElse: () => null);
//           if (item1 != null) {
//             executeUrl = item1["href"];
//           }
//           return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
//         }
//         return null;
//       } else {
//         throw Exception(body["message"]);
//       }
//     } catch (e) {
//       print(e.toString());

//       rethrow;
//     }
//   }

//   // for executing the payment transaction
//   Future<String?> executePayment(url, payerId, accessToken) async {
//     try {
//       var response = await http.post(url,
//           body: convert.jsonEncode({"payer_id": payerId}),
//           headers: {
//             "content-type": "application/json",
//             'Authorization': 'Bearer ' + accessToken
//           });

//       final body = convert.jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         return body["id"];
//       }
//       return null;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
