import 'package:flutter/material.dart';
import 'package:seclob/core/errors/exception.dart';
import 'package:seclob/core/utils/toast_helper.dart';
import 'package:seclob/features/profile/domain/entities.dart';
import 'package:seclob/features/profile/domain/repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository repository;

  ProfileViewModel(this.repository);

  UserEntity? _user;
  bool _isLoading = false;
  String? _error;

  UserEntity? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUserProfile() async {
          print("calleddd");
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await repository.getUserProfile();
      print("resss${result}");
      _user = result;
   } on AppError catch (error) {
      showToast(error.message);
    } catch (e) {
      showToast(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
