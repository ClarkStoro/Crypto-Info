import 'package:crypto_info/data/dto/HistoryResponse.dart';
import 'package:crypto_info/domain/Mapper.dart';
import 'package:crypto_info/model/HistoryModel.dart';


class HistoryMapper implements Mapper<HistoryDto, HistoryModel> {
  @override
  HistoryModel map(HistoryDto data) {
    return new HistoryModel(priceUsd: data.priceUsd, time: data.time);
  }
}