import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:se_store/Classes/product.dart';
import 'package:se_store/cart.dart';
import 'package:se_store/productDetail.dart';
import 'package:se_store/profile.dart';

class PageA extends StatefulWidget {
  final FirebaseUser _user;

  PageA(this._user);

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  int _selectedIndex = 0;
  final FirebaseUser _user =
      FirebaseAuth.instance.currentUser() as FirebaseUser;

  List<Product> _cartList = List<Product>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Welcome to MIAGED online store'),
      ),
      body: CustomScrollView(
        slivers: [
          StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection("shirts")
                  .orderBy("price", descending: true)
                  .snapshots(),
              builder: (context, dataSnapshot) {
                return !dataSnapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 1,
                        staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                        itemBuilder: (context, index) {
                          Product product = Product.fromJson(
                              dataSnapshot.data.documents[index].data);
                          return info(product, context);
                        },
                        itemCount: dataSnapshot.data.documents.length,
                      );
              })
        ],
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartPage(_cartList)));
            } else if (_selectedIndex == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage(_user)));
            }
          });
        },
      ),
    ));
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

Widget info(Product p, BuildContext context) {
  List<Product> _cartList = List<Product>();
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductDetail(prod: p)));
    },
    child: Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 120.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Image.network(
              p.urlImg,
              width: 90.0,
              height: 90.0,
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            p.name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            p.description,
                            style:
                                TextStyle(color: Colors.black, fontSize: 13.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: (!_cartList.contains(p))
                          ? IconButton(
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                _cartList.add(p);
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red[900],
                              ),
                              onPressed: () {
                                _cartList.remove(p);
                              },
                            ))
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget card({Color primaryColor = Colors.redAccent, String imgPath}) {
  return Container();
}

void checkCartProds(String productID, BuildContext context) {}
