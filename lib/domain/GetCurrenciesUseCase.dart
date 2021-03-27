import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/presentation/UiMapper.dart';

class GetCurrenciesUseCase{

  UiMapper mapper = new UiMapper();
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