import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_store/page.dart';
import 'package:se_store/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title = ''}) : super(key: key);

  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var authHandler = new User();
  FirebaseUser _user = FirebaseAuth.instance.currentUser() as FirebaseUser;
  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Login",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final seConnecter = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 25.0, 10.0),
        onPressed: () {
          authHandler
              .handleSignInEmail(
                  _emailController.text, _passwordController.text)
              .then((FirebaseUser user) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageA(_user)));
          }).catchError((e) => print("Unsuccessful " + e));
        },
        child: Text("Se Connecter",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In to dive in the MIAGED Store',
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/login.png',
                  height: 90,
                ),
                SizedBox(
                  height: 155.0,
                ),
                SizedBox(height: 45.0),
                email,
                SizedBox(height: 25.0),
                password,
                SizedBox(
                  height: 35.0,
                ),
                seConnecter,
                SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
