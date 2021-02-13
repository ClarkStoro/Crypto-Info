import 'dart:developer';

import 'package:crypto_info/data/CoinRepositoryImpl.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/domain/GetCurrenciesUseCase.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/ui/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(CryptoInfo());
}

class CryptoInfo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Info',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'Crypto Info Home'),
    );
  }
}
