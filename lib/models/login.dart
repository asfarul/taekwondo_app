import 'data.dart';
import 'meta.dart';

class Login {
  Meta? meta;
  Data? data;

  Login({this.meta, this.data});

  @override
  String toString() => 'Login(meta: $meta, data: $data)';

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta?.toJson(),
        'data': data?.toJson(),
      };
}
