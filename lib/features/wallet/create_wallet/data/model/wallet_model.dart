// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/wallet_entity.dart';

class Wallet extends WalletEntity{


  Wallet({
    required super.securityCode,
    required super.confirmSecurityCode,
    required super.bankAccount,
  });




  Wallet copyWith({
    String? securityCode,
    String? confirmSecurityCode,
    String? bankAccount,
  }) {
    return Wallet(
      securityCode: securityCode ?? this.securityCode,
      confirmSecurityCode: confirmSecurityCode ?? this.confirmSecurityCode,
      bankAccount: bankAccount ?? this.bankAccount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'securityCode': securityCode,
      'confirmSecurityCode': confirmSecurityCode,
      'bankAccount': bankAccount,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      securityCode: map['securityCode'] as String,
      confirmSecurityCode: map['confirmSecurityCode'] as String,
      bankAccount: map['bankAccount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wallet(securityCode: $securityCode, confirmSecurityCode: $confirmSecurityCode, bankAccount: $bankAccount)';

  @override
  bool operator ==(covariant Wallet other) {
    if (identical(this, other)) return true;
  
    return 
      other.securityCode == securityCode &&
      other.confirmSecurityCode == confirmSecurityCode &&
      other.bankAccount == bankAccount;
  }

  @override
  int get hashCode => securityCode.hashCode ^ confirmSecurityCode.hashCode ^ bankAccount.hashCode;
}
