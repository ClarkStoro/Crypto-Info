import 'dart:developer';

import 'package:crypto_info/data/CoinRepositoryImpl.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:flutter/material.dart';
import 'data/dto/Currency.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _name;
  List<CurrencyModel> _currencies = List.empty();


  CoinRepository _repo = new CoinRepositoryImpl();

  void _fetchCurrency() async {
    await _repo.getCurrencies().then((value) => {
      setState(() {
        _currencies = value;
      })
    });
  }


  // Future<CoinCapResponse> _fetchCurrency() async {
  //   final response = await http.get('https://api.coincap.io/v2/assets/');
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     log(response.body);
  //     CoinCapResponse res = CoinCapResponse.fromJson(response.body);
  //     setState(() {
  //         _name = res.data[0].name;
  //
  //         _currencies = res.data;
  //     });
  //     return res;
  //
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  border: Border.all(
                    color: Colors.blue,
                  ),
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://static.coincap.io/assets/icons/eth@2x.png")
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
