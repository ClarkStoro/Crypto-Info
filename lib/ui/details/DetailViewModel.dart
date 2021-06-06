import 'dart:collection';

import 'package:crypto_info/domain/useCase/GetHistoryUseCase.dart';
import 'package:crypto_info/presentation/HistoryUi.dart';
import 'package:flutter/foundation.dart';

class DetailViewModel extends ChangeNotifier {
  final GetHistoryUseCase _getHistoryUseCase;

  DetailViewModel(this._getHistoryUseCase);

  bool _isLoading = true;
  Exception? _error;

  String get error => _error?.toString() ?? "";

  List<HistoryUi> _items = [];

  /// An unmodifiable view of the items
  UnmodifiableListView<HistoryUi> get items => UnmodifiableListView(_items);

  void getHistory(String id) {
    _items.clear();
    startLoading();
    _getHistoryUseCase.execute(id).then((value) {
      value.forEach((element) {
        print("price ${element.priceUsd} ==> ${element.time}");
      });
      _items = value;
    }).catchError((e) {
      _error = e;
    }).whenComplete(() {
      stopLoading();
    });
  }

  void refresh(String id) {
    getHistory(id);
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
