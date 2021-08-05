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
}
