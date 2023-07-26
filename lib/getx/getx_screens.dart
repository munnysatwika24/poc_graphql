import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class MyGetX extends StatelessWidget {
  const MyGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [GetPage(name: "/detailsPage", page:()=>DetailScreen() ,transition: Transition.leftToRight)],
        home: Scaffold(
          appBar: AppBar(title: Text("GetX")),
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/detailsPage",
                      );

                },
                child: Text("Please Tap here")),
          ),
        ));
  }
}
