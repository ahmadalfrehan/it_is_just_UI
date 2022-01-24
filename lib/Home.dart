// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:programming_language/Product.dart';
import 'package:programming_language/Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Add.dart';
import 'HisProducts.dart';

class Home extends StatefulWidget {
  var image;
  Home(this.image);

  @override
  _HomeState createState() => _HomeState(this.image);
}

bool isArabic = false;
int i = 0;
int Selected = 0;
List Catergo = ["All", "food", "clothes", "cooking", "frut", "chaires"];

class _HomeState extends State<Home> {
  var image;
  _HomeState(this.image);
  ReturnOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isArabic = prefs.getBool('options')!;
      String s = isArabic.toString();
      print(s);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReturnOptions();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(!isArabic ? "Home Page" : "الصفحة الرئيسية"),
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: (size.width * 0.03) - 0,
                      left: (size.width * 0.03) - 0,
                    ),
                    child: ClipOval(
                      child: image == null
                          ? Image.asset("build/assets/A.jpg")
                          : Image.file(
                              image,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(isArabic ? "اسم المستخدم" : "user name"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(isArabic
                          ? "الادوات التي سجل فيها المستخدم "
                          : "the tool that a user register with"),
                    ],
                  ),
                  const Divider(
                    color: Colors.black54,
                    thickness: 2,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HisProducts(image, isArabic),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(isArabic
                            ? "مشاهدة منتجاتي "
                            : "view your products"),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Add(//isArabic
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(isArabic ? "اضافة منتج" : "Add Product ?"),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      isArabic == true ? isArabic = false : isArabic = true;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('options', isArabic);
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Text(isArabic ? "تغيير اللغة ؟" : "change language?"),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      var e = AlertDialog(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: SizedBox(
                          height: 120,
                          width: 150,
                          child: Container(
                            child: Column(
                              children: [
                                Text(isArabic
                                    ? "هل انت متاكد من انك تريد تسجيل الخروج ؟"
                                    : "Are you sure you want to log out ?\n"),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Sign(),
                                      ),
                                    );
                                  },
                                  child: Text(isArabic
                                      ? "? تسجيل الخروج"
                                      : "log out ?"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      showDialog(context: context, builder: (context) => e);
                    },
                    child: Row(
                      children: [
                        Text(isArabic ? "تسجيل الخروج؟" : "log out ?"),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return isArabic
                        ? "! الحقل يجب الا يكون فارغ "
                        : "the field must not be empty";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Catergo.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      Selected = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: index == Selected
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(Catergo[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 110, 200, 222),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
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
        // Container(
        //   margin: const EdgeInsets.fromLTRB(1, 1, 14, 10),
        //   height: 115,
        //   decoration: BoxDecoration(
        //     color: Colors.green,
        //     borderRadius: BorderRadius.circular(22),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.fromLTRB(1, 1, 18, 10),
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
            bottom: 15,
            top: 15,
            right: 20,
            left: 150,
            child: Container(
              width: 200,
              height: 170,
              child: image == null
                  ? Image.asset("build/assets/A.jpg")
                  : Image.file(
                      image,
                      fit: BoxFit.contain,
                      height: 170,
                      width: 200,
                    ),
            )),
        Positioned(
          top: 30,
          left: 20,
          child: Text(isArabic ? "اسم المنتج " : "ahmad"),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Text(isArabic ? "السعر هو " : "the price is "),
        ),
        Positioned(
          bottom: 1,
          left: 1,
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Product(image, isArabic),
                ),
              );
            },
            child: Text(isArabic ? "< مشاهدة المنتج " : "View the Product >"),
          ),
        ),
      ],
    );
  }
}
