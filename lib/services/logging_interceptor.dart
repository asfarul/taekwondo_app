part of 'services.dart';

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) {
    print("--> ${options.method} ${options.path}");
    print("Content type: ${options.contentType}");
    print("<-- END HTTP");
    return super.onRequest(options, requestInterceptorHandler);
  }

  @override
  void onResponse(Response response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }
    print("<-- END HTTP");

    return super.onResponse(response, responseInterceptorHandler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler errorInterceptorHandler) {
    print("<-- Error -->");
    print(err.error);
    print(err.message);
    return super.onError(err, errorInterceptorHandler);
  }
}
