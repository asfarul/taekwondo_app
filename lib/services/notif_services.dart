part of 'services.dart';

class NotifServices extends BaseServices {
  Future<dynamic> getAllNotif(BuildContext context, String url) async {
    var response = await request(context, url, RequestType.GET, useToken: true);
    if (response != null) {
      return response;
    }
  }

  Future<dynamic> accept(BuildContext context, FormData data) async {
    var response = await request(context, Api.accept, RequestType.POST,
        useToken: true, data: data);
    if (response != null) {
      return response;
    }
  }

  Future<dynamic> decline(BuildContext context, FormData data) async {
    var response = await request(context, Api.decline, RequestType.POST,
        useToken: true, data: data);
    if (response != null) {
      return response;
    }
  }
}
