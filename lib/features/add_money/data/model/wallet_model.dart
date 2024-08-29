// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/wallet_entity.dart';

class Code extends CodeEntity{
  Code({
    required super.code,
  });

  Code copyWith({
    String? code,
  }) {
    return Code(
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
    };
  }

  factory Code.fromMap(Map<String, dynamic> map) {
    return Code(
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Code.fromJson(String source) => Code.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Code(code: $code)';

  @override
  bool operator ==(covariant Code other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code;
  }

  @override
  int get hashCode => code.hashCode;
}
