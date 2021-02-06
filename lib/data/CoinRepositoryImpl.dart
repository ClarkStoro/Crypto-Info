import 'dart:math';

import 'package:crypto_info/data/ApiCoin.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/ModelMapper.dart';

class CoinRepositoryImpl implements CoinRepository{

  ApiCoin _api = new ApiCoin();
  ModelMapper _mapper = new ModelMapper();

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    List<CurrencyModel> list = new List();
    await _api.fetchCurrency().then((value) => {
        value.data.forEach((element) {
          list.add(_mapper.map(element));
        })
     });
     return list;
  }
}