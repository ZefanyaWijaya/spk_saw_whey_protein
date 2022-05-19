import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage2>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
        child: Row(
          children: [
            Container(
              width: 850,
              height: 850,
              // constraints: BoxConstraints(maxHeight: window.physicalSize.height),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pict2.jpg'),
                  fit: BoxFit.cover,
                  
                )
              ),
            ),
            Container(
              color: Colors.white,
              width: 735,
              child: _buildLoginForm(),
            ),
          ],
          
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     _buildImageWallpaper(),
        //     _buildLoginForm()
        //   ],
        // ),
      ),
    );
  }

  Widget _buildImageWallpaper () {
    return Container(
      constraints: BoxConstraints(),
      child: Expanded(child: Image.asset('assets/images/pict1.jpg')),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      width: 400,
      child: Column(
        children: [
          const Text("Login Pengguna" , style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold ),),
          const SizedBox(height: 30),
          _emailForm(context),
          const SizedBox(height: 30),
          _passwordForm(context)

        ],
      ),
    );
  }

  Widget _emailForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Email",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(83, 81, 81, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FormBuilderTextField(
          name: "email",
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
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
        ),
      ],
    );
  }

  Widget _passwordForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Password",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(83, 81, 81, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FormBuilderTextField(
          name: "password",
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
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
        ),
      ],
    );
  }
}