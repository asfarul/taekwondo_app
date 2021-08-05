part of 'services.dart';

class NotifServices extends BaseServices {
  Future<dynamic> getAllNotif(BuildContext context, String url) async {
    var response = await request(context, url, RequestType.GET, useToken: true);
    if (response != null) {
      return response;
    }
  }
}
