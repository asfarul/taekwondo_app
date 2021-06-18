class Pivot {
  String? modelId;
  String? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  @override
  String toString() {
    return 'Pivot(modelId: $modelId, roleId: $roleId, modelType: $modelType)';
  }

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json['model_id'] as String?,
        roleId: json['role_id'] as String?,
        modelType: json['model_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'model_id': modelId,
        'role_id': roleId,
        'model_type': modelType,
      };
}
