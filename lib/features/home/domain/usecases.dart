

import 'package:seclob/features/home/domain/entity.dart';
import 'package:seclob/features/home/domain/repository.dart';

class GetBalancesUseCase {
  final BalanceRepository repository;

  GetBalancesUseCase(this.repository);

  Future<List<Balance>> call() async {
    return await repository.getBalances();
  }
}
