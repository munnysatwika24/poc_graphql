import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail Screen"),),
        body: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text("Welcome To Magical World")
              ),ElevatedButton(onPressed: (){
                Get.snackbar("Hello", "Darlingsssssssss",
                    snackPosition: SnackPosition.TOP);
              }, child: Text("press"))

            ],
          ),
        ),
      );

  }
}
