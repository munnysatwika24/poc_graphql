import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';
class MyGetX extends StatelessWidget {
  const MyGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(debugShowCheckedModeBanner: false,
    home: Scaffold(appBar: AppBar(title: Text("GetX")),body:Center(child: ElevatedButton(onPressed: (){
      Get.to(DetailScreen(),transition:Transition.leftToRightWithFade,arguments: "I'm a Positive Person" );
      Get.snackbar("Hello", "Darlingsssssssss",snackPosition: SnackPosition.BOTTOM);
    }, child: Text("Press")),) ,));
  }
}
