import 'data.dart';
import 'meta.dart';

class ClubJoin {
  Meta? meta;
  Data? data;

  ClubJoin({this.meta, this.data});

  factory ClubJoin.fromJson(Map<String, dynamic> json) => ClubJoin(
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
