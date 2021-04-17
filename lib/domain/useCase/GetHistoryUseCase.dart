import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/presentation/HistoryUi.dart';
import 'package:crypto_info/presentation/mapper/UiHistoryMapper.dart';

class GetHistoryUseCase{
  UiHistoryMapper mapper = new UiHistoryMapper();
  final CoinRepository repo;

  GetHistoryUseCase(this.repo);

  Future<List<HistoryUi>> execute(String id) {
    return repo.getHistory(id, "d1",null,null).then((response) {
      var products = response
          .map((e) => mapper.map(e))
          .toList();
      return products;
    });
  }
}