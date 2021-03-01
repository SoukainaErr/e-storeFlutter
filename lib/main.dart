import 'package:flutter/material.dart';
import 'package:se_store/loginScreen.dart';
import 'package:se_store/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'seStore Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetStartedPage(titre: 'MIAGED'),
    );
  }
}

class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key key, this.titre = ''}) : super(key: key);

  final String titre;

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Welcome To MIAGED App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/miaged.png',
              height: 180,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to MIAGED ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 10),
            Text(
              'start your online shopping experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.brown,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            } else if (_selectedIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            }
          });
        },
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.login),
      label: 'Login',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.login_sharp),
      label: 'Sign Up',
    ),
  ];
}
