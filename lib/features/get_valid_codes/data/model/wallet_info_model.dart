import '../../domain/entity/wallet_info_entity.dart';

class CodeInfo extends CodeInfoEntity{

  CodeInfo({
    required super.id,
    required super.code,
    required super.amount,
  });

  factory CodeInfo.fromJson(Map<String, dynamic> json) {
    return CodeInfo(
      id: json['id'],
      code: json['code'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'amount': amount,
    };
  }
}

class ResponseBody {
  final String message;
  final String status;
  final String localDateTime;
  final List<CodeInfo> body;

  ResponseBody({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory ResponseBody.fromJson(Map<String, dynamic> json) {
    return ResponseBody(
      message: json['message'],
      status: json['status'],
      localDateTime: json['localDateTime'],
      body: List<CodeInfo>.from(
        json['body'].map((item) => CodeInfo.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'localDateTime': localDateTime,
      'body': body.map((item) => item.toJson()).toList(),
    };
  }
}
