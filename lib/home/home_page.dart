import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> icons = [];
  bool buutubu = false;
  int index = 0;
  int tuuraJoop = 0;
  int tuuraEmesJoop = 0;
  List<SurooJoop> surooJoop = [
    SurooJoop(
      suroo: 'Flutter деген мобилдик колдонмолорду иштеп чыгуу учун SDK',
      joop: true,
    ),
    SurooJoop(
      suroo: 'Flutterде колдонулган программалоо тили Java',
      joop: false,
    ),
    SurooJoop(
      suroo: 'Dart тилиндеги озгормо const',
      joop: false,
    ),
    SurooJoop(
      suroo: 'Flutter де негизги функция main()',
      joop: true,
    ),
    SurooJoop(
      suroo: 'Flutter де виджеттердин аталышы Css',
      joop: false,
    ),
    SurooJoop(
        suroo: 'Dart тили Google компаниясы тарабынан иштелип чыккан',
        joop: true
        ),
  ];

  String getQuestion() {
    if (index < surooJoop.length - 1) {
      return surooJoop[index].suroo;
    } else {
      return '';
    }
  }

  bool? getAnswer() {
    if (index < surooJoop.length) {
      return surooJoop[index].joop;
    } else {
      return null;
    }
  }

  void surooJooptuTeksher(bool koldonuuchununJoobu) {
    final programistinjoobu = getAnswer();
    if (koldonuuchununJoobu == programistinjoobu) {
      icons.add(const Icon(
        Icons.check,
        color: Colors.green,
        size: 60,
      ));
      tuuraJoop++;
    } else if (koldonuuchununJoobu != programistinjoobu) {
      icons.add(const Icon(
        Icons.close,
        color: Colors.red,
        size: 60,
      ));
      tuuraEmesJoop++;
    }
    if (getQuestion() == '') {
      buutubu = true;
    }
    index++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff363636),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: buutubu == true
                  ? AlertDialog(
                      title: Text('Suroo buttu'),
                      actions: [
                        Column(
                          children: [
                            Text('Tuura jooptordun jyiyntygy $tuuraJoop'),
                            Text(
                                'Tuura emes jooptordun jyiyntygy $tuuraEmesJoop'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            tuuraEmesJoop = 0;
                            tuuraJoop = 0;
                            buutubu = false;
                            index = 0;
                            getQuestion();
                            icons = [];
                            setState(() {});
                          },
                          child: Text('Kaira bashta!'),
                        ),
                      ],
                    )
                  : Text(
                      surooJoop[index].suroo,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
            Column(
              children: [
                ChoiceButtonWidget(
                  onTap: () {
                    surooJooptuTeksher(true);
                  },
                  text: 'True',
                  color: Colors.green,
                ),
                SizedBox(height: 20),
                ChoiceButtonWidget(
                  onTap: () {
                    surooJooptuTeksher(false);
                  },
                  text: 'False',
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: icons,
            ),
            SizedBox(height: 20.0),
            if (index >= surooJoop.length)
              Text(
                'Right answers: $tuuraJoop\nUncorrect answers: $tuuraEmesJoop',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
          ],
        ),
      ),
    );
  }
}

class ChoiceIcon extends StatelessWidget {
  const ChoiceIcon({
    super.key,
    required this.icon,
    required this.color,
  });
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 70,
      color: color,
    );
  }
}

class ChoiceButtonWidget extends StatelessWidget {
  const ChoiceButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final String text;
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          splashColor: color,
          onTap: onTap,
          child: Container(
            width: 335.0,
            height: 70.0,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        ),
        color: Colors.transparent,
      ),
      color: Colors.indigo,
    );
  }
}

class Toyota {
  final String camry; // 2
  final String corolla; // 10
  final String ist; // 5

  Toyota({
    required this.camry,
    required this.corolla,
    required this.ist,
  });
}

class Camry {
  final int orun;
  final String jurumu;

  Camry({required this.orun, required this.jurumu});
}

class SurooJoop {
  final String suroo;
  final bool joop;

  SurooJoop({
    required this.suroo,
    required this.joop,
  });
}
