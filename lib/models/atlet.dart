import 'package:taekwondo_app/models/user_model.dart';

class Atlet {
  String? id;
  UserModel? user;
  Kategori? kategori;
  Kelas? kelas;
  bool? status;
  DateTime tglBergabung;
  int? recordCount;

  Atlet({
    required this.id,
    required this.user,
    required this.kategori,
    required this.kelas,
    required this.status,
    required this.tglBergabung,
    required this.recordCount,
  });

  factory Atlet.fromJson(Map<String, dynamic> json) => Atlet(
      id: json['id'] as String,
      user: json['user'] == null ? null : UserModel.fromJson(json['user']),
      kategori:
          json['category'] == null ? null : Kategori.fromJson(json['category']),
      kelas: json['class'] == null ? null : Kelas.fromJson(json['class']),
      status: json['status'] == 1 ? true : false,
      tglBergabung: DateTime.parse(json['tgl_bergabung'] as String),
      recordCount: json['records_count'] as int);
}

class Kategori {
  String? id;
  String? nama;

  Kategori({
    required this.id,
    required this.nama,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json['id'] as String,
        nama: json['nama'] as String,
      );
}

class Kelas {
  String? id;
  String? nama;
  String? kategoriId;
  String? jenisKelamin;

  Kelas({
    required this.id,
    required this.nama,
    required this.kategoriId,
    required this.jenisKelamin,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
      id: json['id'] as String,
      nama: json['nama'] as String,
      kategoriId: json['category_id'] as String,
      jenisKelamin: json['jenis_kelamin'] ?? null);
}
