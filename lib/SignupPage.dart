import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }

    final RegExp emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup Page')),
      body: Column(
        children: [
          Image.asset('assets/images/signup_images.png'),
          SizedBox(
            height: 20.4,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: _validatePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _signup,
                    child: Text('Signup'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
