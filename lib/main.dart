import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/login_page.dart';

void main()  {
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

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            return const LoginPage();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}




