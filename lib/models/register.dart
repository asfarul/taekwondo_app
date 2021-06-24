import 'data.dart';
import 'meta.dart';

class Register {
  Meta? meta;
  Data? data;

  Register({this.meta, this.data});

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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
