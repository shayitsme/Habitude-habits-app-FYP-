import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/comHelper.dart';
import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/Screens/SignupForm.dart';
import 'package:toast/toast.dart';
import '../Comm/genLoginSignupHeader.dart';
import '../DatabaseHandler/DbHelper.dart';
import '../customAppBar.dart';
import 'HomeForm.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = new GlobalKey<FormState>();
  get children => null;
  final conEmail = TextEditingController();
  final conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String email = conEmail.text;
    String passwd = conPassword.text;

    if (email.isEmpty) {
      alertDialog(context, "Please enter Email");
    } else if(passwd.isEmpty) {
      alertDialog(context, "Please enter password");
    } else{
      await dbHelper.getLoginUser(email, passwd).then((userData) {
        if (userData != null) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => HomeForm()),
                  (Route<dynamic> route) => false);
        } else {
          alertDialog(context, "Error: User not found");
        }

      }).catchError((error){
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: PreferredSize(
          child: ClipPath(
            clipper: CustomAppBar(),
            child: Container(color: Colors.amber[400], child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('Hello!', style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),),
              Text('Welcome back to Habitude', style: TextStyle(color: Colors.brown[500], fontSize: 20, fontStyle: FontStyle.italic),),

            ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 100)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Log In'),
                  getTextFormField(controller: conEmail,
                      hintName: 'Email',
                      icon: Icons.email),
                  SizedBox(height: 5.0),
                  getTextFormField(controller: conPassword,
                    hintName: 'Password',
                    icon: Icons.lock,
                    isObscureText: true,
                  ),

                  TextButton(
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(300.0, 0.0),
                      backgroundColor: Colors.amber[400],
                      onSurface: Colors.grey,
                    ),
                    onPressed: login,
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
                      primary: Colors.black,
                      minimumSize: Size(300.0, 0.0),
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









