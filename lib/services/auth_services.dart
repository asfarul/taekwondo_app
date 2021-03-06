part of 'services.dart';

class AuthServices extends BaseServices {
  Future<Login?> login(BuildContext context, FormData data) async {
    var response = await request(context, Api.login, RequestType.POST,
        data: data, useToken: false);
    if (response != null) {
      return Login.fromJson(response);
    }
  }

  Future<Register?> register(BuildContext context, FormData data) async {
    var response = await request(context, Api.register, RequestType.POST,
        data: data, useToken: false);

    if (response != null) {
      return Register.fromJson(response);
    }
  }

  Future<dynamic> getUser(BuildContext context) async {
    var response =
        await request(context, Api.user, RequestType.GET, useToken: true);

    if (response != null) {
      return response;
    }
  }

  Future<dynamic> updateUser(BuildContext context, FormData data) async {
    var response = await request(context, Api.updateUser, RequestType.POST,
        data: data, useToken: true);

    if (response != null) {
      return response;
    }
  }
}
