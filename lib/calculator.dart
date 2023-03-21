// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key, required String title});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

//UI
class _CalculatorAppState extends State<CalculatorApp> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => {},
      child: Text(
        btnText,
        style: TextStyle(
            fontSize: 25, color: txtColor, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Color(0xFFeeedf2),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    result,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 80),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Color(0xFFff8d01), Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", Color(0xFF272727), Colors.white),
                numButton("8", Color(0xFF272727), Colors.white),
                numButton("9", Color(0xFF272727), Colors.white),
                numButton("x", Color(0xFFff8d01), Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", Color(0xFF272727), Colors.white),
                numButton("5", Color(0xFF272727), Colors.white),
                numButton("6", Color(0xFF272727), Colors.white),
                numButton("-", Color(0xFFff8d01), Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", Color(0xFF272727), Colors.white),
                numButton("2", Color(0xFF272727), Colors.white),
                numButton("3", Color(0xFF272727), Colors.white),
                numButton("+", Color(0xFFff8d01), Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Color(0xFF272727)),
                ),
                numButton(".", Color(0xFF272727), Colors.white),
                numButton("=", Color(0xFFff8d01), Colors.white),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

//logic
  String result = "0";
  String operation = "";
  double num1 = 0.0;
  double num2 = 0.0;

  // ignore: unused_element
  void _numButton(String btnText) {
    if (btnText == "C") {
      result = "0";
      operation = "";
      num1 = 0.0;
      num2 = 0.0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      num1 = double.parse(result);
      operation = btnText;
      result = "0";
    } else if (btnText == ".") {
      if (result.contains(".")) {
        return;
      } else {
        result = result + btnText;
      }
    } else if (btnText == "=") {
      num2 = double.parse(result);
      if (operation == "+") {
        result = (num1 + num2).toString();
      }
      if (operation == "-") {
        result = (num1 - num2).toString();
      }
      if (operation == "x") {
        result = (num1 * num2).toString();
      }
      if (operation == "/") {
        result = (num1 / num2).toString();
      }
      operation = "";
      num1 = 0.0;
      num2 = 0.0;
    } else {
      if (result == "0") {
        result = btnText;
      } else {
        result = result + btnText;
      }
    }
    setState(() {});
  }
}
