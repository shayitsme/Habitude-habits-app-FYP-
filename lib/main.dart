import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login with Signup',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LoginForm(),
    );
  }


}
