import 'package:calculator/constants/app_constants.dart';
import 'package:calculator/widgets/left_bar.dart';
import 'package:calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightFeetController = TextEditingController();
  final TextEditingController _heightInchesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                width: 160,
                child: Column(children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 65,
                          child: TextField(
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: accentHexColor),
                            controller: _heightFeetController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ft',
                                hintStyle: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white.withOpacity(0.8))),
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          child: TextField(
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: accentHexColor),
                            controller: _heightInchesController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'in',
                                hintStyle: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white.withOpacity(0.8))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("Height",
                      style: TextStyle(color: accentHexColor.withOpacity(0.7)))
                ])),
            SizedBox(
                width: 130,
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'lbs',
                          hintStyle: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.8))),
                    ),
                    Text("Weight",
                        style:
                            TextStyle(color: accentHexColor.withOpacity(0.7)))
                  ],
                ))
          ]),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: calculate,
              child: Text("Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor))),
          const SizedBox(
            height: 50,
          ),
          Text(_bmiResult.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 90,
                color: accentHexColor,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 30),
          Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(_textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor))),
          const SizedBox(height: 10),
          const LeftBar(
            barWidth: 40,
          ),
          const SizedBox(height: 20),
          const LeftBar(
            barWidth: 70,
          ),
          const SizedBox(height: 20),
          const LeftBar(
            barWidth: 40,
          ),
          const SizedBox(height: 20),
          const RightBar(
            barWidth: 70,
          ),
          const SizedBox(height: 50),
          const RightBar(
            barWidth: 70,
          ),
        ]),
      ),
    );
  }

  void calculate() {
    double hFt = double.parse(_heightFeetController.text);
    double hIch = _heightInchesController.text.isNotEmpty
        ? double.parse(_heightInchesController.text)
        : 0;
    double h = (hFt * 12) + hIch;
    double w = double.parse(_weightController.text);
    setState(() {
      _bmiResult = (w / (h * h)) * 703;
      if (_bmiResult > 25) {
        _textResult = "You're over weight";
      } else if (_bmiResult >= 18.5 && _bmiResult <= 29) {
        _textResult = "You have normal weight";
      } else {
        _textResult = "You're underweight";
      }
    });
  }
}
