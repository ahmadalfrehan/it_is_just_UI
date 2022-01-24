// ignore_for_file: file_names
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'Home.dart';
import 'Login.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var nameController = TextEditingController();
  TextEditingController? endController = TextEditingController();
  var CategoryController = TextEditingController();
  var InformationController = TextEditingController();
  var modController = TextEditingController();
  var priceController = TextEditingController();
  var price1Controller = TextEditingController();
  var percController = TextEditingController();
  var price2Controller = TextEditingController();
  var perc2Controller = TextEditingController();
  var price3Controller = TextEditingController();
  var perc3Controller = TextEditingController();
  var price4Controller = TextEditingController();
  var perce4Controller = TextEditingController();

  List Info = [
    'Discountdate',
    "Discout percentage",
    'Discountdate 1',
    "Discout percentage 1",
    'Discountdate 2',
    "Discout percentage 2",
    'Discountdate 3',
    "Discout percentage 3",
    'Discountdate 4',
    "Discout percentage 4",
  ];
  var image;
  final Picker = ImagePicker();
  getImage(ImageSource sre) async {
    final Pac = await Picker.getImage(source: sre);
    setState(() {
      if (Pac != null) {
        image = File(Pac.path);
      }
    });
  }

  String? dropdown;
  int d = 0;
  var drop = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: [
              const Text('Add product',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              newMethod("Name", nameController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: "date of end "),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse("2022-05-03"),
                    );
                    // if (pickedDate != null) {
                    //   print(
                    //       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    //   String formattedDate =
                    //       //DateFormat('yyyy-MM-dd').format(pickedDate);
                    //   print(
                    //       // formattedDate); //formatted date output using intl package =>  2021-03-16
                    //   //you can implement different kind of Date Format here according to your requirement

                    //   setState(() {
                    //     endController!.text = formattedDate;
                    //     print(
                    //         "Date is selected"); //set output date to TextField value.
                    //   });
                    // } else {
                    //   print("Date is not selected");
                    // }
                  },
                  controller: endController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              // newMethod("Category", CategoryController),
              newMethod("Communication Info", InformationController),
              newMethod("Quantity available from the product", modController),
              newMethod("Price", priceController),
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
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    hint: const Text("اختر عدد النسب والخصم "),
                    iconSize: 30,
                    style: const TextStyle(color: Colors.black),
                    items: <int>[2, 4, 6, 8, 10].map((int val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(val.toString()),
                      );
                    }).toList(),
                    onChanged: (int? val) {
                      setState(() {
                        drop = val!;
                        print(drop);
                        d = drop;
                      });
                    },
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         fillColor: Colors.white,
              //         filled: true,
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //         labelText: "kjfb"),
              //     controller: drop,
              //     keyboardType: TextInputType.number,
              //     validator: (String? value) {
              //       if (value!.isEmpty) {
              //         return 'the field must not be empty';
              //       }
              //       return null;
              //     },
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: d * 100,
                  child: ListView.builder(
                    itemCount: d,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(Info[index]),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'the field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
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
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    hint: dropdown == null
                        ? const Text("  Select the category ")
                        : Text(
                            dropdown!,
                            style: const TextStyle(color: Colors.black),
                          ),
                    iconSize: 30,
                    style: const TextStyle(color: Colors.black),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.orange),
                  primary: Colors.orange,
                  elevation: 7,
                  shape: const StadiumBorder(side: BorderSide()),
                  fixedSize: const Size(300, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Select an image ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  var e = AlertDialog(
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Ok',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text("Choose image"),
                    content: Container(
                      height: 150,
                      child: Column(
                        children: [
                          const Divider(color: Colors.grey),
                          Container(
                            color: Colors.orange,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.image, color: Colors.white),
                              title: const Text("Galllery",
                                  style: TextStyle(color: Colors.white)),
                              onTap: () => getImage(ImageSource.gallery),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.orange,
                            child: ListTile(
                              leading: const Icon(Icons.add_a_photo,
                                  color: Colors.white),
                              title: const Text("Camera",
                                  style: TextStyle(color: Colors.white)),
                              onTap: () => getImage(ImageSource.camera),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  showDialog(context: context, builder: (context) => e);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  primary: Colors.white,
                  elevation: 7,
                  shape: const StadiumBorder(side: BorderSide()),
                  fixedSize: const Size(300, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(image),
                    ),
                  );
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void take(String text) {
    try {
      int number = int.parse(text);
    } on FormatException {}
  }

  Widget SingleITk(int index) {
    var In = Info[index];
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text("${index + 1}"),
          ),
          Expanded(
            child: TextField(
              onChanged: (tex) {
                take(tex);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding newMethod(String s, var x) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: s),
        controller: x,
        keyboardType: TextInputType.text,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'the field must not be empty';
          }
          return null;
        },
      ),
    );
  }
}





// // ignore_for_file: file_names, prefer_const_constructors
// // ignore: prefer_const_constructors
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'Home.dart';
// import 'Login.dart';

// class Add extends StatefulWidget {
//   bool? isArabic;
//   Add(this.isArabic);
//   @override
//   _AddState createState() => _AddState(this.isArabic);
// }

// class _AddState extends State<Add> {
//   var nameController = TextEditingController();
//   var endController = TextEditingController();
//   var CategoryController = TextEditingController();
//   var phoneController = TextEditingController();
//   var facebookController = TextEditingController();
//   var modController = TextEditingController();
//   var priceController = TextEditingController();
//   bool? isArabic;
//   _AddState(this.isArabic);
//   var image;
//   final Picker = ImagePicker();
//   getImage(ImageSource sre) async {
//     final Pac = await Picker.getImage(source: sre);
//     setState(() {
//       if (Pac != null) {
//         image = File(Pac.path);
//       }
//     });
//   }

//   String? dropdown;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         constraints: const BoxConstraints.expand(),
//         decoration: const BoxDecoration(
//           color: Colors.teal,
//         ),
//         child: Card(
//           margin: const EdgeInsets.fromLTRB(10, 15, 10, 90),
//           elevation: 55,
//           shape: BeveledRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
//             child: Column(
//               children: [
//                 Text(isArabic! ? "اضافة منتج " : 'Add product',
//                     style:
//                         TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//                 newMethod(isArabic! ? "اسم المنتج" : "Name of product",
//                     nameController),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         labelText:
//                             isArabic! ? "تاريخ الانتهاء " : "date of end "),
//                     onTap: () {
//                       showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime.now(),
//                         lastDate: DateTime.parse("2022-05-03"),
//                       ).then((value) => endController.text);
//                     },
//                     controller: endController,
//                     keyboardType: TextInputType.text,
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return isArabic!
//                             ? "الحقل يحب الا يكون فارغا"
//                             : 'the field must not be empty';
//                       }

//                       return null;
//                     },
//                   ),
//                 ),
//                 newMethod(isArabic! ? "رقم الهاتف " : "Phone number",
//                     phoneController),
//                 newMethod(isArabic! ? " رابط الفيسبوك" : "Facenook Url",
//                     facebookController),
//                 newMethod(
//                     isArabic!
//                         ? "الكمية المتوفرة من المنتج"
//                         : "Quantity available from the product",
//                     modController),
//                 newMethod(isArabic! ? "السعر" : "Price", priceController),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.black54),
//                       boxShadow: const [
//                         BoxShadow(
//                           blurRadius: 1,
//                           color: Colors.black26,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: DropdownButton(
//                       isDense: false,
//                       dropdownColor: Colors.teal,
//                       borderRadius: BorderRadius.circular(45),
//                       hint: dropdown == null
//                           ? Text(isArabic!
//                               ? "اختار التصنيف "
//                               : "  Select the category ")
//                           : Text(
//                               dropdown!,
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                       isExpanded: true,
//                       iconSize: 30,
//                       style: const TextStyle(color: Colors.white),
//                       items: <String>[
//                         'phones',
//                         'computers',
//                         'food',
//                         'clothes',
//                         'chaires',
//                         'books',
//                         'fruites',
//                         'other'
//                       ].map((String val) {
//                         return DropdownMenuItem<String>(
//                           value: val,
//                           child: Text(val),
//                         );
//                       }).toList(),
//                       onChanged: (String? val) {
//                         setState(() {
//                           dropdown = val!;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.white,
//                     elevation: 550,
//                     shape: const StadiumBorder(side: BorderSide()),
//                     fixedSize: const Size(340, 30),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.camera_alt_outlined,
//                         color: Colors.black,
//                       ),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         isArabic! ? "اختر الصورة " : "Select an image ",
//                         style: TextStyle(color: Colors.teal),
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     var e = AlertDialog(
//                       shape: BeveledRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       title: Text(isArabic!
//                           ? "اختيار الصورة "
//                           : "Choose picture from ?"),
//                       content: Container(
//                         height: 150,
//                         child: Column(
//                           children: [
//                             const Divider(color: Colors.black),
//                             Container(
//                               color: Colors.teal,
//                               child: ListTile(
//                                 leading: const Icon(Icons.image),
//                                 title: Text(isArabic!
//                                     ? "اختيار من معرض الصور "
//                                     : "Galllery"),
//                                 onTap: () => getImage(ImageSource.gallery),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               color: Colors.teal,
//                               child: ListTile(
//                                 leading: const Icon(Icons.add_a_photo),
//                                 title: Text(isArabic!
//                                     ? "اختيار من الكاميرا "
//                                     : "Camera"),
//                                 onTap: () => getImage(ImageSource.camera),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                     showDialog(context: context, builder: (context) => e);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         child: SizedBox(
//           height: 60,
//           width: 386,
//           child: FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Home(image),
//                 ),
//               );
//             },
//             shape: BeveledRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Text(
//               isArabic! ? "حفظ" : 'Save',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.teal),
//             ),
//             backgroundColor: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   Padding newMethod(String s, var x) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//             fillColor: Colors.white,
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             labelText: s),
//         controller: x,
//         keyboardType: TextInputType.text,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return isArabic!
//                 ? "! الحقل يجب الا يكون فارغ "
//                 : "the field must not be empty";
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }
