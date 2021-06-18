part of 'services.dart';

enum RequestType {
  GET,
  POST,
  DELETE,
}

class BaseServices {
  Dio _dio = new Dio();
  Options? _headersOption;
  final _credentials = GetStorage(myCred);

  void _getToken() {
    var _token = _credentials.read(authKey);
    _headersOption = ConfigServices.getHeaders(token: _token);
  }

  Future<dynamic> request(
    BuildContext context,
    String url,
    RequestType requestType, {
    FormData? data,
    dynamic param,
    bool? useToken,
  }) async {
    var response;

    if (useToken != null && useToken) {
      _getToken();
    } else {
      _headersOption = ConfigServices.getHeaders();
    }

    // Switch case untuk request dio
    try {
      switch (requestType) {
        case RequestType.POST:
          response = await _dio.post(
            url,
            data: data,
            options: _headersOption,
            queryParameters: param,
          );
          break;
        case RequestType.GET:
          response = await _dio.get(
            url,
            options: _headersOption,
            queryParameters: param,
          );
          break;
        case RequestType.DELETE:
          response = await _dio.delete(url, options: _headersOption);
      }
    } on DioError catch (e) {
      response = e.response;
    }

    //* Handling error and status code
    var result = json.decode(response.toString());
    print(result);

    //* if 401 then return to login
    if (response.statusCode > 200) {
      // DialogUtils.instance.showInfo(
      //     context,
      //     "Session Expired, silahkan masukkan api key yang valid",
      //     Icons.error,
      //     "OK", onClick: () async {
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, RouterGenerator.routeHome, (route) => false);
      // });
      WidgetHelpers.snackbar(context, SnackbarType.error,
          title: "Error!", message: result['data']['message'] ?? '-');
      return null;
    }

    return result;
  }
}
