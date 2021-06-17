part of 'services.dart';

class AuthServices extends BaseServices {
  Future<void> login(BuildContext context, FormData data) async {
    var response = await request(context, Api.login, RequestType.POST,
        data: data, useToken: false);

    if (response != null) {
      WidgetHelpers.snackbar(context, SnackbarType.success,
          title: 'Success', message: 'Login Berhasil!');
    }
  }
}
