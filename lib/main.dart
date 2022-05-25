
import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:login_with_signup/provider/habits.dart';
import 'package:login_with_signup/provider/habits2.dart';
import 'package:login_with_signup/provider/habits3.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      MultiProvider(
          providers: [
            ChangeNotifierProvider<HabitsProvider>(create: (context) => HabitsProvider()),
            ChangeNotifierProvider<Habits2Provider>(create: (context) => Habits2Provider()),
            ChangeNotifierProvider<Habits3Provider>(create: (context) => Habits3Provider()),
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login with Signup',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const LoginForm(),
      ));
}







