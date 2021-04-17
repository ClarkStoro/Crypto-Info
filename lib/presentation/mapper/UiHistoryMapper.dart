import 'package:crypto_info/domain/Mapper.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/HistoryModel.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/presentation/HistoryUi.dart';
import 'package:intl/intl.dart';

class UiHistoryMapper extends Mapper<HistoryModel,HistoryUi>{

  DateFormat _formatter = DateFormat('dd/MM/yyyy');

  @override
  HistoryUi map(HistoryModel data) {
    return new HistoryUi(
        priceUsd: data.priceUsd,
        time: _formatter.format(DateTime.fromMicrosecondsSinceEpoch(data.time*1000))
    );
  }
}