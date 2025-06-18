import 'package:dio/dio.dart';
import 'package:seclob/core/errors/exception.dart';
import 'package:seclob/core/network/api_client.dart';
import 'package:seclob/core/network/api_endpoint.dart';
import 'package:seclob/features/home/data/model.dart';
import 'package:seclob/features/home/domain/entity.dart';
import 'package:seclob/features/home/domain/repository.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  final ApiClient _apiClient;

  BalanceRepositoryImpl(this._apiClient);

  @override
  Future<List<Balance>> getBalances() async {
    try {
      final response = await _apiClient.get(APIEndPoints.home);
      final balanceResponse = BalanceResponse.fromJson(response.data);
      return balanceResponse.balances;
    } on DioException catch (e) {
      throw DioExceptionHandler.handleDioError(e);
    }
  }
}
