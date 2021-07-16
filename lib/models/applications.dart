import 'club.dart';
import 'user.dart';

class Applications {
  String? id;
  User? user;
  Club? club;
  String? tanggalMelamar;

  Applications({this.id, this.user, this.club, this.tanggalMelamar});

  factory Applications.fromJson(Map<String, dynamic> json) => Applications(
        id: json['id'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        club: json['club'] == null
            ? null
            : Club.fromJson(json['club'] as Map<String, dynamic>),
        tanggalMelamar: json['tanggal_melamar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'club': club?.toJson(),
        'tanggal_melamar': tanggalMelamar,
      };
}
