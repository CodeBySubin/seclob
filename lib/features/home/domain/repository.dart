import 'package:seclob/features/home/domain/entity.dart';

abstract class BalanceRepository {
  Future<List<Balance>> getBalances();
}
