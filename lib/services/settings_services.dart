part of 'services.dart';

class SettingServices extends BaseServices {
  Future<dynamic> getSettingsData(BuildContext context) async {
    var response =
        await request(context, Api.settings, RequestType.GET, useToken: true);
    if (response != null) {
      return response;
    }
  }
}
