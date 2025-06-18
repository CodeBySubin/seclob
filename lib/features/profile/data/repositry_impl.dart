import 'package:dio/dio.dart';
import 'package:seclob/core/errors/exception.dart';
import 'package:seclob/core/network/api_client.dart';
import 'package:seclob/core/network/api_endpoint.dart';
import 'package:seclob/features/profile/data/profile_model.dart';
import 'package:seclob/features/profile/domain/entities.dart';
import 'package:seclob/features/profile/domain/repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryImpl(this._apiClient);

  @override
@override
Future<UserEntity> getUserProfile() async {
  try {
    final response = await _apiClient.get(APIEndPoints.profile);
    final userData = response.data['data'];
    final userModel = UserModel.fromJson(userData);
    return userModel;
  } on DioException catch (e) {
    throw DioExceptionHandler.handleDioError(e);
  }
}

}
