import 'dart:collection';

import 'package:crypto_info/domain/GetCurrenciesUseCase.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final GetCurrenciesUseCase getCurrenciesUseCase;

  HomeViewModel(this.getCurrenciesUseCase);

  bool _isLoading = true;
  Exception _error;

  String get error => _error.toString();

  final List<CurrencyUi> _items = [];

  /// An unmodifiable view of the items
  UnmodifiableListView<CurrencyUi> get items => UnmodifiableListView(_items);


  void getCurrencies() {
    _items.clear();
    startLoading();
    getCurrenciesUseCase.execute().then((value) =>
        _items.addAll(value)
    ).catchError((e) {
        _error = e;
    }).whenComplete(() {
      stopLoading();
    });
  }


  void refresh() {
    getCurrencies();
  }

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
      _error = null;
  }


  bool isLoading() => _isLoading;

  bool hasErrors() => _error != null;
}