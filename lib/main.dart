import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danny Calculator',
//To Remove the debug logo
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scientific Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  //operand means the signs we need
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == 'x') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains(".")) {
        print("Already contains a decimal");
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      //For same numbers
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }
    print(_output);
//If the user clicks = then our Public output will be set to double digits
    setState(() {
//The output will be set to double digits
      output = double.parse(_output).toStringAsFixed(1);
    });
  }

//A widget that rebuilds a button via a loop
  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: OutlinedButton(
            //Then we call the function buttonPressed()
            onPressed: () => buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Danny Marvel',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'German Calculator',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ],
                ),
                Row(children: [
                  buildButton("CLEAR"),
                  buildButton('='),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
