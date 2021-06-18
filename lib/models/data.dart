import 'user.dart';

class Data {
  String? accessToken;
  String? tokenType;
  User? user;
  String? baseFoto;

  Data({this.accessToken, this.tokenType, this.user, this.baseFoto});

  @override
  String toString() {
    return 'Data(accessToken: $accessToken, tokenType: $tokenType, user: $user, baseFoto: $baseFoto)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json['access_token'] as String?,
        tokenType: json['token_type'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        baseFoto: json['base_foto'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'user': user?.toJson(),
        'base_foto': baseFoto,
      };
}
