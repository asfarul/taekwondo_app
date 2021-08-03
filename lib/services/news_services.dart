part of 'services.dart';

class NewsServices extends BaseServices {
  Future<dynamic> getAllNews(BuildContext context) async {
    var response =
        await request(context, Api.berita, RequestType.GET, useToken: false);
    if (response != null) {
      return response;
    }
  }
}
