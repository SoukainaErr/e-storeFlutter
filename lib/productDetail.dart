import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se_store/Classes/product.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({this.prod});

  final Product prod;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantite = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Product Detail'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.network(widget.prod.urlImg),
                      ),
                      Container(
                        color: Colors.grey[200],
                        child: SizedBox(
                          height: 1.0,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.prod.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.prod.description,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.prod.price.toString() + " €",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.prod.taille,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 10),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () => print("clicked"),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45.0,
                        child: Center(
                          child: Text(
                            "Add to my cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
