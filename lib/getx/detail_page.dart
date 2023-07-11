import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail Screen"),),
        body: Column(
          children: [
            Center(child: Text("Welcome To Magical World")),
            Row(
              children: [
                IconButton(icon:Icon(Icons.arrow_back_ios_rounded), onPressed: (){
                  Get.back();
                }, ),
                Text("Back")
              ],
            )
          ],
        ),
      );

  }
}
