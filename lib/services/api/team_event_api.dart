import 'package:gooto/services/api/api.dart';

class TeameventsApi {
  Api api = Api();

  static final TeameventsApi _authApi = TeameventsApi._internal();

  factory TeameventsApi() {
    return _authApi;
  }

  TeameventsApi._internal();

  Future<dynamic> getTeams() async {
    return await api.httpGet("teams", query: {'status': 'approved'});
  }
}
