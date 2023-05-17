import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Press me'),
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.red.withOpacity(0.8);
                              }
                              return Colors.transparent;
                            },
                          ),
                        ),
                      ),
                      //  const Text(
                      //   'data',
                      //   textAlign: TextAlign.right,
                      //   style: TextStyle(
                      //     fontSize: 36,
                      //     fontWeight: FontWeight.bold,
                      //     fontStyle: FontStyle.italic,
                      //     fontFamily: 'PBI',
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetRowBottom('ac', 'ce', '%', '/'),
                      GetRowBottom('1', '2', '3', '*'),
                      GetRowBottom('4', '5', '6', '-'),
                      GetRowBottom('7', '8', '9', '+'),
                      GetRowBottom('00', '0', '.', '='),
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

class GetRowBottom extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const GetRowBottom(this.text1, this.text2, this.text3, this.text4,
      {super.key});

  @override
  Widget build(BuildContext context) {
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
}

class SingleBottom extends StatelessWidget {
  final String text;
  const SingleBottom(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isboldbottom(text)) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkResponse(
          onTap: () {},
          child: Container(
            height: 80,
            width: 62,
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
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 36,
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
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 62,
          width: 62,
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
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 36,
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
