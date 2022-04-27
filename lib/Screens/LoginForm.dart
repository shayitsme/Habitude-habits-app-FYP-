import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/Screens/SignupForm.dart';
import '../Comm/genLoginSignupHeader.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  get children => null;
  final conUserId = TextEditingController();
  final conPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habitude'),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Login'),
                  getTextFormField(controller: conUserId,
                      hintName: 'User ID',
                      icon: Icons.person),
                  SizedBox(height: 5.0),
                  getTextFormField(controller: conPassword,
                    hintName: 'Password',
                    icon: Icons.lock,
                    isObscureText: true,
                  ),

                  TextButton(
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.amber[400],
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No account? Sign up here',
                        style: TextStyle(
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text('Sign Up'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.amber[400],
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:(_)=> SignupForm()));
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}






