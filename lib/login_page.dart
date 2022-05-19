import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
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
      ),
    );
  }


  Widget _buildLoginForm() {
    return Column(
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

  Widget _buildLoginButton () {
    return Container(
      width: 500,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          
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