import 'package:taekwondo_app/models/club_model.dart';
import 'package:taekwondo_app/models/user_model.dart';

class NotificationModel {
  String? id;
  UserModel? user;
  ClubModel? club;
  DateTime? tglMelamar;

  NotificationModel({
    required this.id,
    required this.user,
    required this.club,
    required this.tglMelamar,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'],
        user: json['user'] == null ? null : UserModel.fromJson(json['user']),
        club: json['club'] == null ? null : ClubModel.fromJson(json['club']),
        tglMelamar: DateTime.parse(json['tanggal_melamar']),
      );
}
