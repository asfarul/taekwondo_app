class Pelatih {
  String? id;
  String? name;
  String? alamat;
  String? noHp;
  String? jenisKelamin;
  String? tglLahir;
  dynamic urlFoto;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Pelatih({
    this.id,
    this.name,
    this.alamat,
    this.noHp,
    this.jenisKelamin,
    this.tglLahir,
    this.urlFoto,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Pelatih.fromJson(Map<String, dynamic> json) => Pelatih(
        id: json['id'] as String?,
        name: json['name'] as String?,
        alamat: json['alamat'] as String?,
        noHp: json['no_hp'] as String?,
        jenisKelamin: json['jenis_kelamin'] as String?,
        tglLahir: json['tgl_lahir'] as String?,
        urlFoto: json['url_foto'],
        email: json['email'] as String?,
        emailVerifiedAt: json['email_verified_at'],
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'alamat': alamat,
        'no_hp': noHp,
        'jenis_kelamin': jenisKelamin,
        'tgl_lahir': tglLahir,
        'url_foto': urlFoto,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
