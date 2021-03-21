import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/ui/HomeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_info/service_locator.dart';

class Home extends StatefulWidget {

  const Home({Key? key, this.title=""}) : super(key: key);

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

  Future _fetchCurrency() async {
    return sl<HomeViewModel>().getCurrencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _fetchCurrency(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text("ERROR: ${snapshot.error}")); //throw snapshot.error;
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          List<CurrencyUi> userData = snapshot.data as List<CurrencyUi>;
          return userData.isEmpty ? Center(
              child: Text("NOPP")
          ) : ListView.builder(
            itemCount: userData.length,
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
                      backgroundImage: NetworkImage("${userData[index].uriImg}"),
                    backgroundColor: Colors.lightBlue[100],
                  ),
                  title: Text("${userData[index].symbol} - ${userData[index].name}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  subtitle: Text("\$ ${userData[index].price} | ${userData[index].changePercent24Hr}",style: TextStyle(color: userData[index].isNegative?Colors.red:Colors.green),),
                  onTap: () => {},
                ),
              );
            },
          );
        },
      )
    );
  }
}
