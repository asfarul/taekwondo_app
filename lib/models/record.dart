import 'package:intl/intl.dart';

class Record {
  String? id;
  String? nama;
  String? tingkat;
  String? peringkat;
  DateTime? tglMulai;
  DateTime? tglAkhir;

  Record({
    this.id,
    this.nama,
    this.tingkat,
    this.peringkat,
    this.tglMulai,
    this.tglAkhir,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json['id'] as String?,
        nama: json['nama'] as String?,
        tingkat: json['tingkat'] as String?,
        peringkat: json['peringkat'] as String?,
        tglMulai: json['tanggal_dimulai'] == null
            ? null
            : DateTime.parse(json['tanggal_dimulai'] as String),
        tglAkhir: json['tanggal_berakhir'] == null
            ? null
            : DateTime.parse(json['tanggal_berakhir'] as String),
      );
}
