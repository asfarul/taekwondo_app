class Club {
  String? id;
  String? idPelatih;
  String? namaKlub;
  String? deskripsi;
  String? coordinat;
  String? alamat;
  dynamic urlFoto;
  String? createdAt;
  String? updatedAt;

  Club({
    this.id,
    this.idPelatih,
    this.namaKlub,
    this.deskripsi,
    this.coordinat,
    this.alamat,
    this.urlFoto,
    this.createdAt,
    this.updatedAt,
  });

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        id: json['id'] as String?,
        idPelatih: json['id_pelatih'] as String?,
        namaKlub: json['nama_klub'] as String?,
        deskripsi: json['deskripsi'] as String?,
        coordinat: json['coordinat'] as String?,
        alamat: json['alamat'] as String?,
        urlFoto: json['url_foto'],
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_pelatih': idPelatih,
        'nama_klub': namaKlub,
        'deskripsi': deskripsi,
        'coordinat': coordinat,
        'alamat': alamat,
        'url_foto': urlFoto,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
