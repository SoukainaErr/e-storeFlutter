import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_store/page.dart';
import 'package:se_store/user.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title = ''}) : super(key: key);

  final String title;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var authHandler = new User();
  FirebaseUser _user = FirebaseAuth.instance.currentUser() as FirebaseUser;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final email = TextField(
      controller: _emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextField(
      controller: _passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final enregister = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 25.0, 10.0),
        onPressed: () {
          authHandler
              .handleSignUp(_emailController.text, _passwordController.text)
              .then((FirebaseUser user) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageA(_user)));
          }).catchError((e) => print(e));
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Your MIAGED Account",
          style:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.blueGrey),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/signup.png',
                  height: 90,
                ),
                SizedBox(
                  height: 155.0,
                ),
                SizedBox(height: 45.0),
                email,
                SizedBox(height: 25.0),
                password,
                SizedBox(height: 25.0),
                enregister,
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
