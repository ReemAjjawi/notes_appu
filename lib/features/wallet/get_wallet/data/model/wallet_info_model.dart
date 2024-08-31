import '../../domain/entity/wallet_info_entity.dart';

class WalletInfo extends WalletInfoEntity {

  WalletInfo({
    required super.id,
    required super.balance,
    required super.bankAccount,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      id: json['id'],
      balance: json['balance'],
      bankAccount: json['bankAccount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'bankAccount': bankAccount,
    };
  }
}
