class Meta {
  int? code;
  bool? status;
  String? message;

  Meta({this.code, this.status, this.message});

  @override
  String toString() {
    return 'Meta(code: $code, status: $status, message: $message)';
  }

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json['code'] as int?,
        status: json['status'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
      };
}
