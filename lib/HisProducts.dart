// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:programming_language/Edit.dart';
import 'package:programming_language/Product.dart';

class HisProducts extends StatefulWidget {
  var image;
  bool? isArabic;
  HisProducts(this.image, this.isArabic);
  @override
  _HisProductsState createState() =>
      _HisProductsState(this.image, this.isArabic);
}

class _HisProductsState extends State<HisProducts> {
  var image;
  bool? isArabic;
  _HisProductsState(this.image, this.isArabic);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 110, 200, 205),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: const EdgeInsets.fromLTRB(10, 20, 4, 20),
                      itemBuilder: (context, index) => newMethod(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget newMethod() {
    return Stack(
      children: [
        /*Container(
          margin: const EdgeInsets.fromLTRB(1, 1, 14, 10),
          height: 360,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(22),
          ),
        ),*/
        Container(
          margin: const EdgeInsets.fromLTRB(1, 1, 18, 10),
          height: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          top: 20,
          left: 100,
          right: 100,
          child: Container(
            width: 110,
            height: 120,
            child: image == null
                ? Image.asset("build/assets/A.jpg")
                : Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          bottom: 170,
          left: 30,
          child: Text(isArabic! ? "اسم المنتج " : "name of the product:"),
        ),
        Positioned(
          bottom: 110,
          left: 30,
          child: Text(isArabic! ? "السعر " : "the price is :"),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(isArabic! ? "حذف " : "Delete"),
                    Icon(Icons.delete)
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 150,
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edit(image, isArabic)));
                },
                child: Row(
                  children: [
                    Text(isArabic! ? "تعديل" : "Edit"),
                    Icon(Icons.edit)
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 260,
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Product(image, isArabic),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(isArabic! ? "< مشاهدة المنتج" : "view >"),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
