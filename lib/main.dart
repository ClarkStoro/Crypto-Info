import 'dart:developer';

import 'package:crypto_info/ui/home.dart';
import 'package:flutter/material.dart';


void main() {
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
      home: Home(title: 'Crypto Info Home'),
    );
  }
}
