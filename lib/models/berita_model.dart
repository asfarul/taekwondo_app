class BeritaModel {
  int? id;
  String? judul;
  String? konten;
  String? thumbnail;
  String? penulis;
  String? status;
  List<Lampiran>? lampiran;
  DateTime? createdAt;

  BeritaModel({
    required this.id,
    required this.judul,
    required this.konten,
    required this.thumbnail,
    required this.penulis,
    required this.status,
    required this.lampiran,
    required this.createdAt,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        id: json['id'] as int,
        judul: json['judul'] as String,
        konten: json['konten'] as String,
        thumbnail: json['thumbnail'] as String,
        penulis: json['penulis'] as String,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        lampiran: json['lampiran'] == null
            ? null
            : List<Lampiran>.from(
                json['lampiran'].map((x) => Lampiran.fromJson(x))),
      );
}

class Lampiran {
  int? id;
  String? file;

  Lampiran({
    required this.id,
    required this.file,
  });

  factory Lampiran.fromJson(Map<String, dynamic> json) => Lampiran(
        id: json['id'] as int,
        file: json['file'] as String,
      );
}
