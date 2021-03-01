import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se_store/main.dart';

class SaveData extends StatefulWidget {
  SaveData({Key key, this.titre = ''}) : super(key: key);

  final String titre;

  @override
  _SaveDataState createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final Firestore dataRef = Firestore.instance;
  TextEditingController _nomProd = TextEditingController();
  TextEditingController _prixProd = TextEditingController();
  TextEditingController _descProd = TextEditingController();
  TextEditingController _urlImg = TextEditingController();
  TextEditingController _tailleProd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nomProd = TextField(
      controller: _nomProd,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Product Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final prixProd = TextField(
      controller: _prixProd,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Product Price",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final descProd = TextField(
      controller: _descProd,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Product description",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final urlImg = TextField(
      controller: _urlImg,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Product's Image url",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final saveInfo = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 25.0, 10.0),
        onPressed: () {
          createRecord();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GetStartedPage()));
        },
        child: Text("Save Informations",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titre),
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
                SizedBox(
                  height: 120.0,
                ),
                SizedBox(height: 45.0),
                nomProd,
                SizedBox(height: 25.0),
                prixProd,
                SizedBox(height: 45.0),
                descProd,
                SizedBox(height: 25.0),
                urlImg,
                SizedBox(height: 25.0),
                saveInfo,
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

  void createRecord() async {
    await dataRef.collection("products").document("1").setData({
      'name': _nomProd,
      'description': _descProd,
      'price': _prixProd,
      'taille': _tailleProd,
      'urlImage': _urlImg
    });

    DocumentReference ref = await dataRef.collection("shirts").add({
      'name': 'shirt',
      'description': 'available in different colors',
      'price': '9 Eur',
      'taille': 'XS,S,M,L,XL',
      'urlImage':
          'https://www.artofbrilliance.co.uk/wp-content/uploads/2019/02/happy-tshirt-1.jpg'
    });
    print(ref.documentID);
  }
}
