import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se_store/page.dart';

import 'Admin/uploadData.dart';
import 'Classes/product.dart';
import 'Classes/utilisateur.dart';
import 'cart.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(this._user);

  FirebaseUser _user = FirebaseAuth.instance.currentUser() as FirebaseUser;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  var authHandler = new User();

  FirebaseUser _user = FirebaseAuth.instance.currentUser() as FirebaseUser;
  List<Product> _cartList = List<Product>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Your Profile',
            style: TextStyle(color: Colors.orange[700]),
          ),
          actions: [
            RaisedButton(
              color: Colors.black,
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (conext) => SaveData()));
              },
              child: Icon(
                Icons.add_business_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              widget._user == null
                  ? Text('Your profile')
                  : SizedBox(
                      height: 15.0,
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Name: ${widget._user.displayName}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Email: ${widget._user.email}",
                  style: TextStyle(fontSize: 20),
                ),
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
                    MaterialPageRoute(builder: (context) => PageA(_user)));
              } else if (_selectedIndex == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage(_cartList)));
              } else if (_selectedIndex == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(_user)));
              }
            });
          },
        ),
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Acheter',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_shopping_cart),
      label: 'Panier',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_box_rounded),
      label: 'Profil',
    ),
  ];
}
