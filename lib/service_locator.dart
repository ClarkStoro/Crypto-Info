import 'package:crypto_info/data/ApiCoinImpl.dart';
import 'package:crypto_info/data/CoinRepositoryImpl.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/domain/useCase/GetHistoryUseCase.dart';
import 'package:crypto_info/ui/details/DetailViewModel.dart';
import 'package:crypto_info/ui/home/HomeViewModel.dart';
import 'package:get_it/get_it.dart';
import 'domain/ApiCoin.dart';
import 'domain/useCase/GetCurrenciesUseCase.dart';

final sl = GetIt.instance;

void init() async {

  //Viewmodels
  sl.registerLazySingleton<HomeViewModel>(
          () => HomeViewModel(sl()));

  sl.registerLazySingleton<DetailViewModel>(
          () => DetailViewModel(sl()));

  //Usecases
  sl.registerLazySingleton<GetCurrenciesUseCase>(() => GetCurrenciesUseCase(sl()));

  sl.registerLazySingleton<GetHistoryUseCase>(() => GetHistoryUseCase(sl()));

  //Repository
  sl.registerLazySingleton<CoinRepository>(
        () =>
        CoinRepositoryImpl(sl()),
  );

  //API
  sl.registerLazySingleton<ApiCoin>(() => ApiCoinImpl());
}