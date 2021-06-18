import 'pivot.dart';

class Roles {
  String? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  @override
  String toString() {
    return 'Roles(id: $id, name: $name, guardName: $guardName, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot)';
  }

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: json['id'] as String?,
        name: json['name'] as String?,
        guardName: json['guard_name'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'guard_name': guardName,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'pivot': pivot?.toJson(),
      };
}
