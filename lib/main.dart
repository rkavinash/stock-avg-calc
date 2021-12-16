import 'package:flutter/material.dart';
import 'package:stocks_avg_calc/stock_avg_calc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: StockAvgCalc(),
    );
  }
}