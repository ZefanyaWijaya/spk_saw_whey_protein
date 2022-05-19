import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/login_page.dart';

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
    return const MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: SpkSawRunner(),
      home: LoginPage(),
    );
  }
}




