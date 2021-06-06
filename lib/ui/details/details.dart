import 'dart:math';

import 'package:crypto_info/presentation/CurrencyUi.dart';
import 'package:crypto_info/presentation/HistoryUi.dart';
import 'package:crypto_info/ui/details/DetailViewModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class DetailsPage extends StatelessWidget {

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];


  @override
  Widget build(BuildContext context) {

    final CurrencyUi currency = ModalRoute.of(context)!.settings.arguments as CurrencyUi;
    sl<DetailViewModel>().getHistory(currency.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(currency.name),
      ),
      body:  Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child:  ChangeNotifierProvider.value(
              value: sl<DetailViewModel>(),
              child: Consumer<DetailViewModel> (
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading()) {
                    return renderLoading();
                  } else if (viewModel.hasErrors()) {
                    String strError = viewModel.error;
                    viewModel.clearError();
                    return renderError(strError);
                  } else {
                    return renderGraph(viewModel.items);
                  }
                },
              )
          )
        )
      )
    );
  }

  LineChart renderGraph(List<HistoryUi> historyList) {
    return LineChart(
        showGraphData(historyList),
        swapAnimationDuration: Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear // Optional
    );
  }

  LineChartData showGraphData(List<HistoryUi> historyList) {

    return LineChartData(
      //set x and y graph baselines
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),

      // set x and y labels
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '90k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),


      borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],

    );
  }

  Widget renderLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget renderError(String error) {
    return Center(child: Text("ERROR: ${error}"));
  }
}




