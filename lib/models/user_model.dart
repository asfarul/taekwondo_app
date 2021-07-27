import 'package:intl/intl.dart';

class UserModel {
  String? id;
  String? name;
  String? alamat;
  String? noHp;
  String? jenisKelamin;
  DateTime? tglLahir;
  String? urlFoto;
  String? email;
  Role? roles;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.alamat,
    this.noHp,
    this.jenisKelamin,
    this.roles,
    this.tglLahir,
    this.urlFoto,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        alamat: json['alamat'] as String?,
        email: json['email'] as String?,
        jenisKelamin: json['jenis_kelamin'] as String?,
        noHp: json['no_hp'] as String?,
        tglLahir: json['tgl_lahir'] == null
            ? null
            : DateFormat('yyyy-MM-dd').parse(json['tgl_lahir'] as String),
        urlFoto: json['url_foto'] as String?,
        roles: json['roles'] == null
            ? null
            : Role.fromJson(json['roles'][0] as Map<String, dynamic>),
      );
}

class Role {
  String? id;
  String? name;

  Role({
    this.id,
    this.name,
  });

  @override
  String toString() {
    return 'Role(id: $id, name: $name)';
  }

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );
}
