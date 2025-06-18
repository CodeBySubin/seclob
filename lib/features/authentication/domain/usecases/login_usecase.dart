import 'package:seclob/features/authentication/data/model/login_model.dart';
import 'package:seclob/features/authentication/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginModel> call(String email, String password) {
    return repository.login(email, password);
  }
}
