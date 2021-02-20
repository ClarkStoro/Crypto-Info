import 'package:crypto_info/domain/GetCurrenciesUseCase.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final GetCurrenciesUseCase getCurrenciesUseCase;

  HomeViewModel(this.getCurrenciesUseCase);

  Future<List<CurrencyUi>> getCurrencies() {
     return getCurrenciesUseCase.execute();
  }
}