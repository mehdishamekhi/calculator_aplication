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
  String inputuser = '';
  void bottompressed(String text) {
    setState(() {
      inputuser = inputuser + text;
    });
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
              Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('data'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('data'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
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
            onPressed: () {},
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
          onPressed: () {},
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
