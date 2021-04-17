import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/ui/home/HomeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_info/service_locator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    sl<HomeViewModel>().getCurrencies();

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Crypto Info App"),
        ),
        body: ChangeNotifierProvider.value(
            value: sl<HomeViewModel>(),
            child: Consumer<HomeViewModel> (
              builder: (context, viewModel, child) {
                  if (viewModel.isLoading()) {
                    return renderLoading();
                  } else if (viewModel.hasErrors()) {
                      String strError = viewModel.error;
                      viewModel.clearError();
                      return renderError(strError);
                  } else {
                    return renderList(viewModel);
                  }
              },
            )
        )
    );
  }


  Widget renderLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget renderError(String error) {
    return Center(child: Text("ERROR: ${error}"));
  }

  Widget renderList(HomeViewModel viewModel) {
    List<CurrencyUi> userData = viewModel.items;
    return
      userData.isEmpty ?
       RefreshIndicator(
        onRefresh: () => _pullToRefresh(viewModel),
        child: renderEmptyList()
       ) :
        RefreshIndicator(
          onRefresh: () => _pullToRefresh(viewModel),
          child: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            CurrencyUi dataItem = userData[index];
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
                      backgroundImage: NetworkImage("${dataItem.uriImg}"),
                    backgroundColor: Colors.lightBlue[100],
                  ),
                  title: Text("${dataItem.symbol} - ${dataItem.name}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  subtitle: Text("\$ ${dataItem.price} | ${dataItem.changePercent24Hr}",style: TextStyle(color: userData[index].isNegative?Colors.red:Colors.green),),
                  onTap: () => {
                    //navigate to details of the selected crypto
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: dataItem
                    )
                  },
                ),
            );
          },
        ),
      );
  }

  Future<void> _pullToRefresh(HomeViewModel viewModel) async {
    return viewModel.refresh();
  }

  Widget renderEmptyList() {
    return Center(
        child:Text("Empty List")
      );
  }
}
