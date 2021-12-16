import 'package:flutter/material.dart';
class StockAvgCalc extends StatefulWidget {
  const StockAvgCalc({
    Key? key,
  }) : super(key: key);

  @override
  State<StockAvgCalc> createState() => _StockAvgCalcState();
}

class _StockAvgCalcState extends State<StockAvgCalc> {
  double numStocksFirstBuy = 0,
      stocksPriceFirstBuy = 0,
      amtInvestedFirstBuy = 0;
  double numStocksSecondBuy = 0,
      stocksPriceSecondBuy = 0,
      amtInvestedSecondBuy = 0;
  double totalUnits = 0, totalAmount = 0, averagePrice = 0;

  final numStocksFirstHolder = TextEditingController();
  final numStocksSecondHolder = TextEditingController();
  final amtFirstHolder = TextEditingController();
  final amtSecondHolder = TextEditingController();

  _calcAmtInvested(buyTime) {
    if (buyTime == 1) {
      setState(() {
        amtInvestedFirstBuy = (numStocksFirstBuy * stocksPriceFirstBuy);
      });
    } else {
      setState(() {
        amtInvestedSecondBuy = (numStocksSecondBuy * stocksPriceSecondBuy);
      });
    }
    setState(() {
      totalUnits = numStocksFirstBuy + numStocksSecondBuy;
      totalAmount = amtInvestedFirstBuy + amtInvestedSecondBuy;
      averagePrice = totalUnits == 0 ? 0 : totalAmount / totalUnits;
    });
  }

  _resetForm() {
    numStocksFirstHolder.clear();
    numStocksSecondHolder.clear();
    amtFirstHolder.clear();
    amtSecondHolder.clear();
    setState(() {
      totalUnits = 0;
      totalAmount = 0;
      averagePrice = 0;
      amtInvestedFirstBuy = 0;
      amtInvestedSecondBuy = 0;
      stocksPriceFirstBuy = 0;
      stocksPriceSecondBuy = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stock Price Average Calculator'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _resetForm,
          tooltip: 'Reset',
          child: const Icon(Icons.autorenew),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'First Buy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: numStocksFirstHolder,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of Stocks',
                  ),
                  onChanged: (n) {
                    numStocksFirstBuy = n!= '' ? double.parse(n) : 0;
                    _calcAmtInvested(1);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: amtFirstHolder,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                  ),
                  onChanged: (n) {
                    stocksPriceFirstBuy = n!= '' ? double.parse(n) : 0;
                    _calcAmtInvested(1);
                  },
                ),
              ),
              Chip(
                label: Text(
                    'Amount invested: ${amtInvestedFirstBuy.toStringAsFixed(2)}'),
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
                color: Colors.cyan,
              ),
              const Text(
                'Second Buy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: numStocksSecondHolder,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Current Number of Stocks',
                  ),
                  onChanged: (n) {
                    numStocksSecondBuy = n!= '' ? double.parse(n) : 0;
                    _calcAmtInvested(2);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: amtSecondHolder,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Current Price',
                  ),
                  onChanged: (n) {
                    stocksPriceSecondBuy = n!= '' ? double.parse(n) : 0;
                    _calcAmtInvested(2);
                  },
                ),
              ),
              Chip(
                label: Text(
                    'Amount invested: ${amtInvestedSecondBuy.toStringAsFixed(2)}'),
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
                color: Colors.cyan,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Chip(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                        backgroundColor: Colors.lightGreen,
                        label: Text(
                          'Total Units: $totalUnits',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Chip(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                      backgroundColor: Colors.cyan,
                      label: Text(
                        'Total Amount: ${totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Chip(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                      backgroundColor: Colors.lime,
                      label: Text(
                        'Average Price: ${averagePrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
