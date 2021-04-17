import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/presentation/mapper/UiCurrencyMapper.dart';

class GetCurrenciesUseCase{

  UiCurrencyMapper mapper = new UiCurrencyMapper();
  final CoinRepository repo;

  GetCurrenciesUseCase(this.repo);

  Future<List<CurrencyUi>> execute() {
      return repo.getCurrencies().then((response) {
        var products = response
            .map((e) => mapper.map(e))
            .toList();
        return products;
      });
    }
}