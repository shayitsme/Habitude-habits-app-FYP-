import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/comHelper.dart';
import 'package:login_with_signup/Comm/genLoginSignupHeader.dart';
import 'package:login_with_signup/DatabaseHandler/DbHelper.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import '../Comm/genTextFormField.dart';
import '../Model/UserModel.dart';


class SignupForm extends StatefulWidget {

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = new GlobalKey<FormState>();
  final conUserId = TextEditingController();
  final conUserName = TextEditingController();
  final conEmail = TextEditingController();
  final conPassword = TextEditingController();
  final conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = conUserId.text;
    String uname = conUserName.text;
    String email = conEmail.text;
    String passwd = conPassword.text;
    String cpasswd = conCPassword.text;

    if (formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        alertDialog(context, 'Password does not match');
      }
      else {
        formKey.currentState!.save();
        UserModel uModel = UserModel(uid, uname, email, passwd);
        dbHelper.saveData(uModel);
        alertDialog(context, "Success");
      }
    }

        if (uid.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (uname.isEmpty) {
      alertDialog(context, "Please Enter User Name");
    } else if (email.isEmpty) {
      alertDialog(context, "Please Enter Email");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else if (cpasswd.isEmpty) {
      alertDialog(context, "Please Confirm Password");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habitude'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genLoginSignupHeader('Signup'),
                    getTextFormField(controller: conUserId,
                        hintName: 'User ID',
                        icon: Icons.person),
                    SizedBox(height: 5.0),
                    getTextFormField(controller: conUserName,
                        hintName: 'User Name',
                        inputType: TextInputType.name,
                        icon: Icons.person_outline),
                    SizedBox(height: 5.0),
                    getTextFormField(controller: conEmail,
                        hintName: 'Email',
                        inputType: TextInputType.emailAddress,
                        icon: Icons.email),
                    SizedBox(height: 5.0),
                    getTextFormField(controller: conPassword,
                      hintName: 'Password',
                      icon: Icons.lock,
                      isObscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    getTextFormField(controller: conCPassword,
                      hintName: 'Confirm Password',
                      icon: Icons.lock,
                      isObscureText: true,
                    ),

                    TextButton(
                      child: Text('Sign Up'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.amber[400],
                        onSurface: Colors.grey,
                      ),
                      onPressed: signUp,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Have an account? Sign In here',
                          style: TextStyle(
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text('Sign In'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.amber[400],
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder:(_)=> LoginForm()),
                                (Route<dynamic> route) => false);
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
