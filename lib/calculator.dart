import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  double billAmount =0.0;
  double tipPercentage =0.0;
  double tipTotal =0.0;
  double total =0.0;
  String tip;

  String calculator(){
    tipTotal = (billAmount* (tipPercentage*.01));
    tip= tipTotal.toStringAsFixed(2);
    total = tipTotal + billAmount;
    return 'The tip total is \$$tip and your final total is \$$total';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Tip Calculator"),
            ),
            body: Column(
              children: <Widget>[
                Container(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Bill Amount",
                      ),
                      onChanged: (value){
                        try{
                          billAmount = double.parse(value);
                        } catch(exception){
                          billAmount = 0.0;
                        }
                      },
                    )
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Tip %",
                      hintText: "15%",
                    ),
                    onChanged: (value){
                      try{
                        tipPercentage = double.parse(value);
                      } catch(exception){
                        tipPercentage = 0.0;
                      }
                    },
                  ),
                ),
                RaisedButton(
                  child: Text('Calculate'),
                  onPressed: (){
                     tipTotal = billAmount * tipPercentage/100;
                     total = billAmount + tipTotal;
                     showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
//                            content: Text('Total Tip: \$$tipTotal \n Total: \$$total'),
                            content:Text(calculator())
                          );
                        }
                     );
                  },
                )
              ],
            )
    );
  }
}

