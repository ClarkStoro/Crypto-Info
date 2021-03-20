import 'dart:collection';

import 'package:crypto_info/domain/GetCurrenciesUseCase.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final GetCurrenciesUseCase getCurrenciesUseCase;

  HomeViewModel(this.getCurrenciesUseCase);

  bool _isLoading = true;
  String error;

  final List<CurrencyUi> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<CurrencyUi> get items => UnmodifiableListView(_items);


  void getCurrencies() {
    _items.clear();
    startLoading();
    getCurrenciesUseCase.execute().then((value) =>
        _items.addAll(value)
    ).catchError((e) {
        error = e.toString();
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


  bool isLoading() => _isLoading;

  bool hasErrors() => error != null && error.isNotEmpty;
}