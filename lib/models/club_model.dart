import 'package:taekwondo_app/models/user_model.dart';

class ClubModel {
  String? id;
  String? nama;
  String? deskripsi;
  String? coordinat;
  String? alamat;
  String? foto;
  UserModel? pelatih;

  ClubModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.coordinat,
    required this.alamat,
    required this.foto,
    required this.pelatih,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) => ClubModel(
        id: json['id'],
        nama: json['nama_klub'],
        deskripsi: json['deskripsi'],
        coordinat: json['coordinat'],
        alamat: json['alamat'],
        foto: json['url_foto'],
        pelatih: json['pelatih'] != null
            ? UserModel.fromJson(json['pelatih'])
            : null,
      );
}
