import 'data.dart';
import 'meta.dart';

class Notification {
  Meta? meta;
  Data? data;

  Notification({this.meta, this.data});

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
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
