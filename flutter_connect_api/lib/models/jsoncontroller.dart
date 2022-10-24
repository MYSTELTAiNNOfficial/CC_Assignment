part of 'model.dart';

class JsonController{
  bool? status;
  int? code;
  String? message;

  JsonController({
    this.status,
    this.code,
    this.message,
  });

  factory JsonController.fromJson(Map<String, dynamic> data) {
    return JsonController(status: data['status'] as bool, code: data['code'] as int, message: data['message'] as String);
  }
}