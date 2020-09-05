import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

//input fields decoration
const InputDecoration kInputDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  isDense: true,
);

//input fields dashed lines
DottedLine kDashedLine = DottedLine(
  dashColor: Colors.grey.shade300,
);

EdgeInsets kFieldsPadding = EdgeInsets.all(10.0);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: UnderlineInputBorder(borderSide: BorderSide(width: 30)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          )),
        ),
        primaryColor: Colors.blue.shade900,
      ),
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatelessWidget {
  final TextEditingController cardNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(7.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: kFieldsPadding,
                    child: Column(
                      children: [
                        TextField(
                          decoration: kInputDecoration.copyWith(
                            labelText: "Cardholder",
                          ),
                        ),
                        kDashedLine
                      ],
                    ),
                  ),
                  Padding(
                    padding: kFieldsPadding,
                    child: Column(
                      children: [
                        TextField(
                          decoration: kInputDecoration.copyWith(
                            labelText: "Type",
                          ),
                        ),
                        kDashedLine
                      ],
                    ),
                  ),
                  Padding(
                    padding: kFieldsPadding,
                    child: Column(
                      children: [
                        TextField(
                          decoration: kInputDecoration.copyWith(
                            labelText: "Card number",
                          ),
                        ),
                        kDashedLine
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: kFieldsPadding,
                          child: Column(
                            children: [
                              TextField(
                                decoration: kInputDecoration.copyWith(
                                  labelText: "Expiry date",
                                ),
                              ),
                              kDashedLine
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: kFieldsPadding,
                          child: Column(
                            children: [
                              TextField(
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: kInputDecoration.copyWith(
                                  labelText: "Security code",
                                ),
                              ),
                              kDashedLine
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: kFieldsPadding,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text("Show requisites"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
