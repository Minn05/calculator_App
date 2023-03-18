import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorApp(title: 'Calculator'),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  final String title;

  const CalculatorApp({super.key, required this.title});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == ":") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      num2 = double.parse(output);
      if (_output.contains(".")) {
        print("Already contains a decimal");
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == ":") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: Divider()),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("AC"),
                    buildButton("DEL"),
                    buildButton("%"),
                    buildButton(":"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("X"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    buildButton(" "),
                    buildButton("0"),
                    buildButton("."),
                    buildButton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
