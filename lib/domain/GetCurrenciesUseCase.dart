import 'package:crypto_info/data/CoinRepositoryImpl.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/presentation/UiMapper.dart';

class GetCurrenciesUseCase{
  UiMapper _mapper = new UiMapper();
  CoinRepository _repo = CoinRepositoryImpl();


  Future<List<CurrencyUi>> execute() async{
      List<CurrencyUi> list = new List();
      await _repo.getCurrencies().then((value) => {
        value.forEach((element) {
          list.add(_mapper.map(element));
        })
      });
      return list;
    }
}