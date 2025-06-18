import 'package:flutter/material.dart';
import 'package:seclob/core/errors/exception.dart';
import 'package:seclob/core/utils/storage_helper.dart';
import 'package:seclob/core/utils/toast_helper.dart';
import 'package:seclob/features/authentication/data/model/login_model.dart';
import 'package:seclob/features/authentication/domain/usecases/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase);
  bool isLoading = false;
  LoginModel? loginData;

Future<bool> login(String phone, String password) async {
  isLoading = true;
  notifyListeners();

  try {
    loginData = await loginUseCase(phone, password);
    await SecureStorageHelper.saveToken(loginData!.accessToken);
    return true;
  } on AppError catch (error) {
    showToast(error.message);
    return false;
  } catch (e) {
    showToast(e.toString());
    return false;
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
}
