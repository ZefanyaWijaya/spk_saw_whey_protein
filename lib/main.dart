import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/firebase_options.dart';
import 'package:spk_saw_whey_protein/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: SpkSawRunner(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  
  const HomePage({
    Key? key
  }) : super (key: key);

  @override
  HomePageState createState() => HomePageState(); 
}

class HomePageState extends State<HomePage> {
  // \
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPage()
    );
  }
}




