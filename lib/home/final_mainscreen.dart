import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loakin/model/categorydata.dart';
import 'package:loakin/pages/addpages.dart';

import '../asset/colors.dart';
import '../pages/profilepage.dart';
import 'main_screen.dart';

class FinalMainScreen extends StatefulWidget {
  int? indexs;
  CategoryModel? category;
  FinalMainScreen({Key? key, this.indexs, this.category}) : super(key: key);

  @override
  State<FinalMainScreen> createState() => _FinalMainScreenState();
}

class _FinalMainScreenState extends State<FinalMainScreen> {
  int currentIndex = 0;
  var screen = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen = [
      MainScreen(),
      AddPage(
        category: widget.category != null ? widget.category! : null,
      ),
      Center(
        child: Text("Coming Soon :)"),
      ),
      ProfilePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[widget.indexs != null ? widget.indexs! : currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.color1,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Postingan',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: 'Aktivitas',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
