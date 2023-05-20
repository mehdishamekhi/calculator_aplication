import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String inputuser = '';
  String result = '';
  void bottompressed(String text) {
    setState(() {
      inputuser = inputuser + text;
    });
  }

  bool isboldbottom(String text) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Widget getRowBottom(
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleBottom(text1),
        SingleBottom(text2),
        SingleBottom(text3),
        SingleBottom(text4),
      ],
    );
  }

  Widget SingleBottom(String text) {
    if (isboldbottom(text)) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 80,
          width: 65,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                //0xFFB71C1C
                color: Color.fromARGB(255, 187, 77, 77),
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 3,
              ),
              BoxShadow(
                color: Color(0xfff297a2),
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              end: Alignment.topRight,
              begin: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color.fromARGB(255, 249, 156, 144),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              if (text == 'ce') {
                setState(() {
                  if (inputuser.isNotEmpty) {
                    inputuser = inputuser.substring(0, inputuser.length - 1);
                  }
                });
              } else if (text == '=') {
                Parser parser = Parser();
                Expression expression = parser.parse(inputuser);
                ContextModel contextModel = ContextModel();
                double eval =
                    expression.evaluate(EvaluationType.REAL, contextModel);
                setState(() {
                  result = eval.toString();
                });
              } else if (text == 'ac') {
                setState(() {
                  result = '';
                  inputuser = '';
                });
              } else {
                bottompressed(text);
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.red;
                  }
                  return Colors.transparent;
                },
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'PBI',
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 68,
        width: 68,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 89, 85, 85),
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 3,
            ),
            BoxShadow(
              color: Color(0xFF9E9E9E),
              offset: Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color(0xFF90CAF9),
            ],
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            bottompressed(text);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color.fromARGB(255, 57, 143, 213);
                }
                return Colors.transparent;
              },
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'PBI',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xFF90CAF9),
                Color(0xFF90CAF9),
                Color(0xFF64B5F6),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        inputuser,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 50,
                          fontFamily: 'PBI',
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0xff1C487A,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        result,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 65,
                          fontFamily: 'PBI',
                          color: Color.fromARGB(255, 33, 47, 243),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getRowBottom('ac', 'ce', '%', '/'),
                      getRowBottom('1', '2', '3', '*'),
                      getRowBottom('4', '5', '6', '-'),
                      getRowBottom('7', '8', '9', '+'),
                      getRowBottom('00', '0', '.', '='),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
