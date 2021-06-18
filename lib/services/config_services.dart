part of 'services.dart';

class ConfigServices {
  static Options getHeaders({String token = ''}) {
    var _headers = Map<String, dynamic>();
    _headers['Accept'] = 'application/json';

    if (token != '') {
      _headers['Authorization'] = 'Bearer $token';
    }

    return Options(headers: _headers);
  }
}
