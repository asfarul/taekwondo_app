part of 'services.dart';

enum RequestType {
  GET,
  POST,
  DELETE,
}

class BaseServices {
  Dio _dio = Dio(BaseOptions(
    receiveTimeout: 30000,
    connectTimeout: 30000,
  ));
  Options? _headersOption;
  final _credentials = GetStorage(myCredPref);

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
    if (_dio.interceptors.isEmpty) _dio.interceptors.add(LoggingInterceptor());
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

      //* Handling error and status code
      var result = json.decode(response.toString());
      // print(result);

      //* if 401 then return to login
      if (response.statusCode > 200) {
        if (result != null) {
          WidgetHelpers.snackbar(context, SnackbarType.error,
              title: "Error!", message: result['data']['message'] ?? '-');
        } else {
          WidgetHelpers.snackbar(context, SnackbarType.error,
              title: "Error!", message: 'Unauthorized');
        }

        return null;
      }

      return result;
    } on DioError catch (e) {
      WidgetHelpers.snackbar(context, SnackbarType.error,
          title: "Gagal!", message: errorMessage(e));
      return null;
    }
  }

  String errorMessage(DioError dioError) {
    String errorDescription = "";
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = cancelMessage;
        break;
      case DioErrorType.connectTimeout:
        errorDescription = connectTimeoutMessage;
        break;
      case DioErrorType.other:
        errorDescription = defaultMessage;
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = receiveTimeoutMessage;
        break;
      case DioErrorType.response:
        var response = json.decode(dioError.response.toString());
        if (response['data'] != null) {
          errorDescription = '${response['data']['message']}';
        } else {
          errorDescription = 'Unauthorized';
        }

        break;
      case DioErrorType.sendTimeout:
        errorDescription = sendTimeoutMessage;
        break;
      default:
        errorDescription = defaultMessage;
        break;
    }

    return errorDescription;
  }
}
