import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:spk_saw_whey_protein/spk_saw_runner.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  //LOGIN FUNCTION

  static Future<User?> loginUsingEmailPassword({
    required String email, 
    required String password, 
    required BuildContext context}) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try { 
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch (exception) {
        if(exception.code == "user-not-found") {
          print("No user found for that email");
        }
      }
      return user;
    }



  @override
  Widget build(BuildContext context) {
    //create controller
    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(maxHeight: window.physicalSize.height),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pict2.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            color: Colors.white,
            width: 735,
            child: _buildLoginForm(),
          ),
        ),
      ),
    );
  }

  // TextEditingController email , TextEditingController password
  Widget _buildLoginForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Login Pengguna" , 
                style: TextStyle(
                  fontSize: 28 , 
                  fontWeight: FontWeight.bold 
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 60),
              _emailForm(context),
              const SizedBox(height: 30),
            ],
          ),
          _passwordForm(context),
          const SizedBox(height: 80),
          _buildLoginButton(),
          const SizedBox(height: 10),
          _continueAsUser(),
          const SizedBox(height: 100),
          _contactUs()
        ],
      ),
    );
  }

  Widget _emailForm(BuildContext context) {
    return FormBuilderTextField(
      name: "email",
      decoration: const InputDecoration(
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 32),
        hintText: "Email",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
      ),
      textInputAction: TextInputAction.next,
      valueTransformer: (String? email) {
        if (email != null) {
          return email.trim();
        } else {
          return null;
        }
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context,
            errorText: 'Please enter your email.'),
      ]),
    );
  }

  // Widget _emailFormTextField(BuildContext context , TextEditingController email) {
  //   return TextField(
  //     controller: email,
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: const InputDecoration(
  //       constraints: BoxConstraints(maxWidth: 500),
  //       hintText: "Email Admin",
  //       prefixIcon: Icon(Icons.mail, color: Colors.black)
  //     ),
  //   );
  // }

  // Widget _passwordFormTextField(BuildContext context , TextEditingController password) {
  //   return TextField(
  //     controller: password,
  //     obscureText: true,
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: const InputDecoration(
  //       constraints: BoxConstraints(maxWidth: 500),
  //       hintText: "Password Admin",
  //       prefixIcon: Icon(Icons.lock, color: Colors.black)
  //     ),
  //   );
  // }

  Widget _passwordForm(BuildContext context) {
    return FormBuilderTextField(
      name: "password",
      decoration: const InputDecoration(
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 32),
        hintText: "Password",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
      ),
      textInputAction: TextInputAction.next,
      valueTransformer: (String? password) {
        if (password != null) {
          return password.trim();
        } else {
          return null;
        }
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context,
            errorText: 'Please enter your password.'),
      ]),
    );
  }

  // Widget _buildLoginButton (TextEditingController emailController, TextEditingController passwordController ) {
  //   return Container(
  //     width: 500,
  //     height: 45,
  //     child: ElevatedButton(
  //       onPressed: () async {
  //         print("TEST DARI BUTTON PERTAMA");
  //         User ? user = await loginUsingEmailPassword(
  //           email: emailController.text.trim(), 
  //           password: passwordController.text.trim(), 
  //           context: context
  //         );
  //         print("TEST DARI BUTTON KEDUA");
  //         print(user);
  //         if(user != null){
  //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SpkSawRunner()));
  //         }
  //       },
  //       child: const Text(
  //         'Sign In',
  //         style: TextStyle(fontSize: 16 , color:  Colors.white, fontWeight: FontWeight.bold),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //           elevation: 0,
  //           primary: Colors.black,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(12),
  //           )),
  //     ),
  //   );
  // }

  Widget _buildLoginButton () {
    return Container(
      width: 500,
      height: 45,
      child: ElevatedButton(
        onPressed: () async {
          print("TEST DARI BUTTON PERTAMA");
          if (_formKey.currentState!.saveAndValidate()) {
            print("test1");
            final Map<String, dynamic> data = _formKey.currentState!.value;
            print("test2");
            User ? user = await loginUsingEmailPassword(
              email: data['email'],
              password: data['password'],
              context: context
            );
            print("test3");
            print(user);
            if(user != null){
              print("test masuk");
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SpkSawRunner()));
            }
          }
          print("TEST DARI BUTTON KEDUA");
        },
        child: const Text(
          'Sign In',
          style: TextStyle(fontSize: 16 , color:  Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }

  Widget _continueAsUser () {
    return TextButton(
      onPressed: () {

      },
      child: const Text('Continue As User' , 
        style: TextStyle(
          fontSize: 18,
          color: Colors.black, 
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _contactUs () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Mengalami Kendala? ", 
          style: TextStyle(
            fontSize: 18,
            color: Colors.black
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
          ),
          onPressed: () {

          },
          child: const Text('Hubungi Kami' , 
            style: TextStyle(
              color: Color.fromRGBO(2, 106, 199, 1),
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}