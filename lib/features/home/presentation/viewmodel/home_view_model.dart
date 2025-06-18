import 'package:flutter/material.dart';
import 'package:seclob/core/errors/exception.dart';
import 'package:seclob/core/utils/toast_helper.dart';
import 'package:seclob/features/home/domain/entity.dart';
import 'package:seclob/features/home/domain/usecases.dart';

class HomeViewModel extends ChangeNotifier {
  final GetBalancesUseCase getBalancesUseCase;

  int _currentIndex = 0;
  List<Balance> balances = [];
  bool isLoading = false;
  String? _error;

  HomeViewModel(this.getBalancesUseCase);
  int get currentIndex => _currentIndex;

  int _sliderIndex = 0;

  int get sliderIndex => _sliderIndex;

  void changeSliderIndex(int index) {
    _sliderIndex = index;
    notifyListeners();
  }

  
  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> fetchBalances() async {
    isLoading = true;
    _error = null;
    notifyListeners();
    try {
      balances = await getBalancesUseCase();
    } on AppError catch (error) {
      showToast(error.message);
    } catch (e) {
      showToast(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
