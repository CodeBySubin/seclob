import 'package:dio/dio.dart';
import 'package:seclob/core/errors/exception.dart';
import 'package:seclob/core/network/api_client.dart';
import 'package:seclob/core/network/api_endpoint.dart';
import 'package:seclob/features/authentication/data/model/login_model.dart';

import 'package:seclob/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;

  AuthRepositoryImpl(this.apiClient);

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await apiClient.post(
        APIEndPoints.login,
        data: {"email": email, "password": password},
      );

      return LoginModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleDioError(e);
    }
  }
}
