import 'package:crypto_info/data/ApiCoinImpl.dart';
import 'package:crypto_info/data/CoinRepositoryImpl.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/domain/GetCurrenciesUseCase.dart';
import 'package:crypto_info/ui/HomeViewModel.dart';
import 'package:get_it/get_it.dart';
import 'domain/ApiCoin.dart';

final sl = GetIt.instance;

void init() async {

  //Viewmodels
  sl.registerLazySingleton<HomeViewModel>(
          () => HomeViewModel(sl()));

  //Usecases
  sl.registerLazySingleton<GetCurrenciesUseCase>(() => GetCurrenciesUseCase(sl()));

  //Repository
  sl.registerLazySingleton<CoinRepository>(
        () =>
        CoinRepositoryImpl(sl()),
  );

  //API
  sl.registerLazySingleton<ApiCoin>(() => ApiCoinImpl());
}