import 'package:crypto_info/data/CoinRepositoryImpl.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/presentation/UiMapper.dart';

class GetCurrenciesUseCase{
  UiMapper _mapper = new UiMapper();
  CoinRepository _repo = CoinRepositoryImpl();


  Future<List<CurrencyUi>> execute() {
      return _repo.getCurrencies().then((response) {
        var products = response
            .map((e) => _mapper.map(e))
            .toList();
        return products;
      });
    }
}