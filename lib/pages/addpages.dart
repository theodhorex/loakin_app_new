import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/home/final_mainscreen.dart';
import 'package:loakin/model/categorydata.dart';
import 'package:loakin/model/postingan_model.dart';
import 'package:loakin/model/user_model.dart';
import 'package:loakin/pages/postcategory.dart';

import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/widgets/small_text.dart';

class AddPage extends StatefulWidget {
  CategoryModel? category;
  AddPage({Key? key, this.category}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // Controller
  late TextEditingController title = TextEditingController();
  late TextEditingController price = TextEditingController();
  late TextEditingController description = TextEditingController();

  // Array
  List<Map<String, dynamic>> data = [
    {'name': 'Pemesanan & Pengiriman', 'value': false},
    {'name': 'COD', 'value': false}
  ];

  // Variables
  bool isChecked1 = false;
  bool isChecked2 = false;
  var dMethod = [];
  var conditions;
  String? imagePath;
  PlatformFile? pickedFile;
  final currencyFormatter =
      NumberFormat.currency(locale: 'ID', symbol: "Rp. ", decimalDigits: 0);
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser;
  var users;

  // Function

  void _onClick2() {
    print(data);
  }

  void _onClick(String? value) {
    // Conditions Field Functions
    conditions = value;
  }

  Future _getUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      print("object");
      loggedInUser = UserModel.fromMap(value.data());
    });
    return "logged!";
  }

  // Select File To Locale Upload

  // Select File To Upload "Firebase"
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  // Upload Selected File
  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  void _getImage() async {
    final ref = FirebaseStorage.instance.ref().child('files/');
    var url = await ref.getDownloadURL();
    print(url);
  }

  @override
  Widget build(BuildContext context) {
    // Checkbox Custom Color And Hover
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return AppColors.color1;
    }

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: selectFile,
                child: (pickedFile != null)
                    ? Container(
                        width: 320,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.file(File(pickedFile!.path!)),
                      )
                    : Container(
                        width: 320,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFe8e8e8),
                                  blurRadius: 5.0,
                                  offset: Offset(-10, 10)),
                              BoxShadow(
                                  color: Colors.white, offset: Offset(-5, 0)),
                              BoxShadow(
                                  color: Colors.white, offset: Offset(5, 0)),
                            ]),
                        child: Icon(Icons.add_rounded),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  BigText(
                    text: "Masukan Detail",
                    size: 25,
                    fw: FontWeight.w800,
                  ),
                ],
              ),
              Container(
                width: 600,
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SmallText(
                          text: "Kategori",
                          color: Colors.black,
                          size: 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(7)),
                        width: 450,
                        height: 50,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PostCategorySelect()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.category != null
                                  ? BigText(text: widget.category!.category)
                                  : BigText(text: "Pilih Kategori"),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                                color: Color.fromARGB(255, 175, 175, 175),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Nama Barang",
                          color: Colors.black,
                          size: 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(7)),
                        width: 450,
                        height: 50,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: title,
                          decoration: InputDecoration(
                              hintText: "Masukan Nama Barang",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 160, 160, 160)),
                              border: InputBorder.none),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  BigText(
                    text: "Tentang Barang",
                    size: 25,
                    fw: FontWeight.w800,
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 30, top: 35)),
                            SmallText(
                              text: "Kondisi",
                              color: Colors.black,
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 100,
                                child: InkWell(
                                  onTap: () {
                                    _onClick("Brand New");
                                  },
                                  child: Container(
                                      width: 97,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Center(
                                        child: SmallText(
                                          text: "Brand New",
                                          color: Colors.black,
                                          size: 13,
                                        ),
                                      )),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                                width: 100,
                                child: InkWell(
                                  onTap: () {
                                    _onClick("Like New");
                                  },
                                  child: Container(
                                      width: 97,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Center(
                                        child: SmallText(
                                          text: "Like New",
                                          color: Colors.black,
                                          size: 13,
                                        ),
                                      )),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                                width: 100,
                                child: InkWell(
                                  onTap: () {
                                    _onClick("Well Used");
                                  },
                                  child: Container(
                                      width: 97,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Center(
                                        child: SmallText(
                                          text: "Well Used",
                                          color: Colors.black,
                                          size: 13,
                                        ),
                                      )),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                                width: 120,
                                child: InkWell(
                                  onTap: () {
                                    _onClick("Heavely Used");
                                  },
                                  child: Container(
                                      width: 110,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Center(
                                        child: SmallText(
                                          text: "Heavely Used",
                                          color: Colors.black,
                                          size: 13,
                                        ),
                                      )),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 31)),
                            SmallText(
                              text: "Harga",
                              color: Colors.black,
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            height: 55,
                            width: 335,
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 3),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 230, 230, 230),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextField(
                              controller: price,
                              decoration: InputDecoration(
                                  hintText: "Masukan Harga Barang!",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 160, 160, 160))),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 31)),
                            SmallText(
                              text: "Deskripsi Barang",
                              color: Colors.black,
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 100,
                          width: 335,
                          padding: EdgeInsets.only(left: 20, right: 20, top: 3),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 230, 230),
                              borderRadius: BorderRadius.circular(7)),
                          child: TextField(
                            controller: description,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                hintText: "Tulis Deskripsi Barang Disini",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 160, 160, 160))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  BigText(
                    text: "Metode Pembayaran",
                    size: 25,
                    fw: FontWeight.w800,
                  ),
                ],
              ),
              Container(
                height: 120,
                width: 360,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(data[index]['name']),
                        value: data[index]['value'],
                        onChanged: (value) {
                          setState(() {
                            data[index]['value'] = value!;
                          });
                        },
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                minWidth: 350,
                height: 55,
                color: AppColors.color1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: BigText(
                  text: "Kirim Postingan!",
                  color: Colors.white,
                ),
                onPressed: () async {
                  final prices = int.parse(price.text);
                  PostinganModel posti = PostinganModel(
                      gambar: pickedFile!.name,
                      kategori: "First Post",
                      nama_barang: title.text,
                      kondisi: conditions,
                      harga: currencyFormatter.format(prices),
                      deskripsi: description.text,
                      metodePembayaran: data);
                  var ids = await post(posti);
                  await uploadFile();
                  title.clear();
                  price.clear();
                  description.clear();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FinalMainScreen()));
                },
              ),
              SizedBox(
                height: 15,
              )
            ],
          )
        ],
      ),
    );
  }

  post(PostinganModel post) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      var model = await firebaseFirestore.collection("postingan").doc();
      model.set(post.toJson());
      return model.id;
    } catch (e) {
      print(e.toString());
    }
  }
}
