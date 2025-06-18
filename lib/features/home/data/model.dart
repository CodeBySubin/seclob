

import 'package:seclob/features/home/domain/entity.dart';

class BalanceModel extends Balance {
  BalanceModel({
    required super.currency,
    required super.balance,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      currency: json['currency'],
      balance: (json['balance'] as num).toDouble(),
    );
  }
}

class BalanceResponse {
  final List<BalanceModel> balances;

  BalanceResponse({required this.balances});

  factory BalanceResponse.fromJson(Map<String, dynamic> json) {
    return BalanceResponse(
      balances: (json['balances'] as List)
          .map((e) => BalanceModel.fromJson(e))
          .toList(),
    );
  }
}
