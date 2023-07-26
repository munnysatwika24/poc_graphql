import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
DataController dataController = Get.put(DataController());
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [headerBar(),listViewWidget()],
        ),
      ),
    );
  }

  Widget headerBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_back_ios_new_rounded),
            Expanded(
                child: Text(
              "Tech Square",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
            )),IconButton(onPressed: (){}, icon: Icon(Icons.view_list_rounded),
            ),IconButton(onPressed: (){}, icon: Icon(Icons.grid_view))
          ],
        ),
      ),
    );
  }
  Widget listViewWidget(){
    return Column(
      children: [
        Container(

          child:ListView.builder(
              itemCount: dataController.user_model!.data!.length,
              shrinkWrap: true,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                        padding: const EdgeInsets.only(left: 20),
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(dataController.user_model!.data![index].picture!),
                            ),
                            const SizedBox(width: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dataController.user_model!.data![index].title!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18
                                  ),),
                                Text(dataController.user_model!.data![index].firstName!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18
                                    )),
                                Text(dataController.user_model!.data![index].lastName!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18
                                    )),
                              ],
                            ),
                          ],
                        )
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              })),
      ],
    );
  }
}
