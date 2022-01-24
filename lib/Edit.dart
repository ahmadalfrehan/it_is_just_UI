// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_this, no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:programming_language/Home.dart';

class Edit extends StatefulWidget {
  var image;
  bool? isArabic;
  Edit(this.image, this.isArabic);

  @override
  _EditState createState() => _EditState(this.image, this.isArabic);
}

class _EditState extends State<Edit> {
  var nameController = TextEditingController();
  var endController = TextEditingController();
  var CategoryController = TextEditingController();
  var phoneController = TextEditingController();
  var facebookController = TextEditingController();
  var QuntityController = TextEditingController();
  var priceController = TextEditingController();

  var image;
  bool? isArabic;
  String? dropdown;
  _EditState(this.image, this.isArabic);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 150, 200),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 20, 4, 20),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(1, 1, 18, 1),
                            height: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 6, 6, 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: 250,
                              width: 150,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(300),
                                ),
                              ),
                              child: image == null
                                  ? Image.asset("build/assets/A.jpg")
                                  : Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              newMethod(isArabic! ? "اسم المنتج" : "Name of product", true,
                  nameController),
              newMethod(isArabic! ? "تاريخ الانتهاء " : "date of end", false,
                  endController),
              newMethod(isArabic! ? "رقم الهاتف " : "Phone number", true,
                  phoneController),
              newMethod(isArabic! ? " رابط الفيسبوك" : "Facenook Url", true,
                  facebookController),
              newMethod(
                  isArabic!
                      ? "الكمية المتوفرة من المنتج"
                      : "Quantity available from the product",
                  true,
                  priceController),
              newMethod(isArabic! ? "السعر" : "Price", true, QuntityController),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black54),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black26,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    isDense: false,
                    dropdownColor: Colors.teal,
                    borderRadius: BorderRadius.circular(45),
                    hint: dropdown == null
                        ? Text(isArabic!
                            ? "اختيار التصنيف "
                            : "  Select the category ")
                        : Text(
                            dropdown!,
                            style: const TextStyle(color: Colors.black),
                          ),
                    isExpanded: true,
                    iconSize: 30,
                    style: const TextStyle(color: Colors.white),
                    items: <String>[
                      'phones',
                      'computers',
                      'food',
                      'clothes',
                      'chaires',
                      'books',
                      'fruites',
                      'other'
                    ].map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        dropdown = val!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  elevation: 550,
                  shape: const StadiumBorder(side: BorderSide()),
                  fixedSize: const Size(370, 30),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(image),
                    ),
                  );
                },
                child: Text(
                  isArabic! ? "حفظ التغييرات " : "Save the changes?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding newMethod(String s, bool t, var Controoler) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(s),
          fillColor: Colors.white,
          filled: true,
          enabled: t,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        controller: Controoler,
        keyboardType: TextInputType.text,
        validator: (String? value) {
          if (value!.isEmpty) {
            return isArabic!
                ? "الحقل يحب الا يكون فارغا"
                : 'the field must not be empty';
          }
          return null;
        },
      ),
    );
  }
}
