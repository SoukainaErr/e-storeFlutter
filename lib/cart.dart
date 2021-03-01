import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se_store/Classes/product.dart';
import 'package:se_store/page.dart';
import 'package:se_store/profile.dart';

class CartPage extends StatefulWidget {
  final List<Product> _cartList;

  CartPage(this._cartList);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 0;
  FirebaseUser _user = FirebaseAuth.instance.currentUser() as FirebaseUser;

  List<Product> _cartList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Your Cart',
            style: TextStyle(color: Colors.green[900]),
          ),
        ),
        body: ListView.builder(
            itemCount: _cartList.length,
            itemBuilder: (context, index) {
              var p = widget._cartList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.network(p.urlImg),
                    title: Text(p.name),
                    trailing: GestureDetector(
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            _cartList.remove(p);
                          });
                        }),
                  ),
                ),
              );
            }),
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
