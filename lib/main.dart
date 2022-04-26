import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/spk_saw_runner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 100,
    //   height: 100,
    //   child: SpkSawRunner()
    // );
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: SpkSawRunner(),
    );
  }
}




