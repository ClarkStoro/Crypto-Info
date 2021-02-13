import 'dart:developer';

import 'package:crypto_info/domain/GetCurrenciesUseCase.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CurrencyUi> _currencies = List.empty();


  GetCurrenciesUseCase _repo = new GetCurrenciesUseCase();

  void _fetchCurrency() async {
    await _repo.execute().then((value) => {
      setState(() {
        _currencies = value;
      })
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _currencies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage("${_currencies[index].uriImg}")
              ),
              title: Text("${_currencies[index].symbol} - ${_currencies[index].name}"),
              subtitle: Text("\$ ${_currencies[index].priceUsd} - ${_currencies[index].changePercent24Hr}"),
              onTap: () => {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchCurrency,
        tooltip: 'Get data',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}