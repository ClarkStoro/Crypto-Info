import 'package:crypto_info/ui/details/details.dart';
import 'package:crypto_info/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'service_locator.dart';


void main() async {
  init();
  runApp(CryptoInfo());
}

class CryptoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Info',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
