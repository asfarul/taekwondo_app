import 'pelatih.dart';

class Clubs {
  String? id;
  String? namaKlub;
  String? deskripsi;
  String? coordinat;
  String? alamat;
  dynamic urlFoto;
  Pelatih? pelatih;

  Clubs({
    this.id,
    this.namaKlub,
    this.deskripsi,
    this.coordinat,
    this.alamat,
    this.urlFoto,
    this.pelatih,
  });

  factory Clubs.fromJson(Map<String, dynamic> json) => Clubs(
        id: json['id'] as String?,
        namaKlub: json['nama_klub'] as String?,
        deskripsi: json['deskripsi'] as String?,
        coordinat: json['coordinat'] as String?,
        alamat: json['alamat'] as String?,
        urlFoto: json['url_foto'],
        pelatih: json['pelatih'] == null
            ? null
            : Pelatih.fromJson(json['pelatih'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_klub': namaKlub,
        'deskripsi': deskripsi,
        'coordinat': coordinat,
        'alamat': alamat,
        'url_foto': urlFoto,
        'pelatih': pelatih?.toJson(),
      };
}
