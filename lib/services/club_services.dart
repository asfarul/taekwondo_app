part of 'services.dart';

class ClubServices extends BaseServices {
  Future<JoinClubResponse?> getAllClubs(BuildContext context) async {
    var response =
        await request(context, Api.club, RequestType.GET, useToken: true);
    if (response != null) {
      return JoinClubResponse.fromJson(response);
    }
  }

  Future<dynamic> joinClub(BuildContext context, FormData data) async {
    var response = await request(context, Api.gabungClub, RequestType.POST,
        data: data, useToken: true);
    if (response != null) {
      return response;
    }
  }

  Future<dynamic> updateClub(BuildContext context, FormData data) async {
    var response = await request(context, Api.updateClub, RequestType.POST,
        data: data, useToken: true);
    if (response != null) {
      return response;
    }
  }

  Future<dynamic> getAthletes(BuildContext context, var param) async {
    var response = await request(context, Api.allAtlet, RequestType.GET,
        useToken: true, param: param);
    if (response != null) {
      return response;
    }
  }

  Future<int?> getNotifCount(BuildContext context, var param) async {
    var response = await request(context, Api.notifCount, RequestType.GET,
        useToken: true, param: param);
    if (response != null) {
      return response['data']?['count'] as int;
    }
  }

  Future<dynamic> getAthleteSettings(BuildContext context) async {
    var response = await request(context, Api.settingsAtlet, RequestType.GET,
        useToken: true);
    if (response != null) {
      return response;
    }
  }
}
