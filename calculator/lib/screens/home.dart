import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '/widgets/leftBar.dart';
import '/widgets/rightBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _power = TextEditingController();
  TextEditingController _issue = TextEditingController();
  String dropdownvalue = 'ADHD';
  var items = [
    'ADHD',
    'Alzheimer',
    'Nowotwór',
    'Demencja',
    'Epilepsja',
    'Parkinson'
  ];
  double cbdDose = 0;
  String textResult = "";
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text("CBD Calculator",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ))),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  child: TextField(
                    controller: _height,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "wiek",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
                Container(
                  width: 140,
                  child: TextField(
                    controller: _weight,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "waga",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  child: TextField(
                    controller: _power,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "moc dawki: 1/2/3",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
                Container(
                    child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Dolegliwość',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: dropdownvalue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        //if (dropdownvalue == "ADHD") print(dropdownvalue);
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                )),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_height.text);
                double _w = double.parse(_weight.text);
                double _p = double.parse(_power.text);

                setState(() {
                  cbdDose;
                  if (_p == 1) {
                    cbdDose = _w * (0.7) * 1;
                    textResult = "mała dawka. ";
                  } else if (_p == 2) {
                    cbdDose = _w * (0.7) * 2.5;
                    textResult = "średnia dawka.";
                  } else {
                    cbdDose = _w * (0.7) * 3.5;
                    textResult = "duża dawka.";
                  }
                });
              },
              child: Container(
                child: Text("Calculate",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).accentColor,
                    )),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 120,
              child: Visibility(
                visible: textResult.isNotEmpty,
                child: Column(
                  children: [
                    Text(cbdDose.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 45,
                          color: Theme.of(context).accentColor,
                        )),
                    SizedBox(height: 15),
                    Text(textResult,
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).accentColor,
                        )),
                  ],
                ),
              ),
            ),
            RightBar(50),
            SizedBox(height: 7),
            RightBar(70),
            SizedBox(height: 7),
            RightBar(40),
            SizedBox(height: 7),
            LeftBar(50),
            SizedBox(height: 7),
            LeftBar(70),
          ],
        ),
      ),
    );
  }
}
