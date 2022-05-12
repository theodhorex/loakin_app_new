import 'package:flutter/material.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/home/final_mainscreen.dart';
import 'package:loakin/model/categorydata.dart';
import 'package:loakin/pages/addpages.dart';

class PostCategorySelect extends StatefulWidget {
  const PostCategorySelect({Key? key}) : super(key: key);

  @override
  State<PostCategorySelect> createState() => _PostCategorySelectState();
}

class _PostCategorySelectState extends State<PostCategorySelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    CategoryModel model = CategoryModel(category: "Ryzen");
                    return FinalMainScreen(
                      indexs: 1,
                      category: model,
                    );
                  }));
                },
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(-10, 10)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ], borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/Ryzen.png",
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        BigText(
                          text: "AMD RYZEN",
                          fw: FontWeight.w700,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
