import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/ui/details/DetailViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service_locator.dart';

class DetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final CurrencyUi currency = ModalRoute.of(context)!.settings.arguments as CurrencyUi;
    sl<DetailViewModel>().getHistory(currency.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(currency.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(currency.name),
      ),
    );
  }
}




