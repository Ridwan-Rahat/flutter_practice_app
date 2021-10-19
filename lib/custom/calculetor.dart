import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BillCalculate extends StatefulWidget {
  const BillCalculate({Key? key}) : super(key: key);

  @override
  _BillCalculateState createState() => _BillCalculateState();
}

class _BillCalculateState extends State<BillCalculate> {
  int _tipPercent = 0;
  int _personCount = 1;
  double _totalBill = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white24,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade700,
                          fontStyle: FontStyle.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "\$ ${calculatePerPerson(_totalBill, _personCount, _tipPercent)}",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade500,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(18.0)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixText: "Total Bill  ",
                        prefixIcon: Icon(Icons.attach_money_outlined)),
                    onChanged: (String value) {
                      try {
                        _totalBill = double.parse(value);
                      } catch (exception) {
                        _totalBill = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.blueGrey.shade700),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_personCount > 1) {
                                  _personCount--;
                                } else {}
                              });
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5.0),
                                  color: Colors.lightBlueAccent.shade200),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          Text(
                            "$_personCount",
                            style: TextStyle(
                                color: Colors.blueAccent.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _personCount++;
                              });
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5.0),
                                  color: Colors.lightBlue.shade200),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.blueGrey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${calculateTotalTip(_totalBill, _personCount, _tipPercent)}",
                          style: TextStyle(
                              color: Colors.blueAccent.shade400,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercent%",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent.shade400),
                      ),
                      Slider(
                          max: 100,
                          min: 0,
                          divisions: 20,
                          value: _tipPercent.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercent = value.round();
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculatePerPerson(double billAmount, int tipBy, int tipPercent) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, tipBy, tipPercent) + billAmount) / tipBy;
    return totalPerPerson.toStringAsFixed(3);
  }

  calculateTotalTip(double billAmount, int tipBy, int tipPercent) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
      Text("Please Enter Your Amount");
    } else {
      totalTip = (billAmount * tipPercent) / 100;
    }
    return totalTip;
  }
}
