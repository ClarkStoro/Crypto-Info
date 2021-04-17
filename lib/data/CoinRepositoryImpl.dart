import 'dart:async';
import 'package:crypto_info/data/dto/CurrencyResponse.dart';
import 'package:crypto_info/domain/ApiCoin.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/HistoryModel.dart';
import 'package:crypto_info/model/mapper/CurrencyMapper.dart';
import 'dto/HistoryResponse.dart';
import 'package:crypto_info/model/mapper/HistoryMapper.dart';

class CoinRepositoryImpl implements CoinRepository{
  final ApiCoin api;
  CurrencyMapper _currencyMapper = new CurrencyMapper();
  HistoryMapper _historyMapper = new HistoryMapper();

  CoinRepositoryImpl(this.api);

  @override
  Future<List<CurrencyModel>> getCurrencies() {
    return api.fetchCurrency().then((response) {
      return response.data?.map((CurrencyDto e) => _currencyMapper.map(e)).toList() ?? [];
    });
  }

  @override
  Future<List<HistoryModel>> getHistory(String id, String interval, int? start, int? end) {
    return api.fetchHistory(id, interval, start, end).then((response) {
      return response.data?.map((HistoryDto e) => _historyMapper.map(e)).toList() ?? [];
    });
  }



}