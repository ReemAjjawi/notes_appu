// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BalanceModel {
  num balance; // Use 'num' to accommodate both int and double types
  BalanceModel({
    required this.balance,
  });
  
  BalanceModel copyWith({
    num? balance, // Change type to 'num?'
  }) {
    return BalanceModel(
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
    };
  }

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      balance: map['balance'] as num, // Change type to 'num'
    );
  }

  String toJson() => json.encode(toMap());

  factory BalanceModel.fromJson(String source) => BalanceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BalanceModel(balance: $balance)';

  @override
  bool operator ==(covariant BalanceModel other) {
    if (identical(this, other)) return true;
  
    return other.balance == balance;
  }

  @override
  int get hashCode => balance.hashCode;
}
