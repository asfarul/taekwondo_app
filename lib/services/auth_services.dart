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
}
