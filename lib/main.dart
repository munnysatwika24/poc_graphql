
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:poc_graphql/getx/getx_screens.dart';
import 'package:poc_graphql/screens/demo1.dart';
import 'package:poc_graphql/screens/display_user.dart';
import 'package:poc_graphql/snackbar.dart';

import 'operations/all_users.dart';
import 'operations/delete_user.dart';
import 'screens/user_add.dart';
// this Main method for graphQl
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initHiveForFlutter(); // for cache
//   runApp( Demo());
// }
void main(){
  runApp(MyGetX());
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL CRUD',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: const Color(0xFFf8f8f8),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            foregroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  );
                } else if (states.contains(MaterialState.disabled)) {
                  return const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  );
                } else {
                  return const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  );
                }
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color(0xFF1769aa);
                } else if (states.contains(MaterialState.disabled)) {
                  return const Color(0xFFa6d5fa);
                }
                return const Color(0xFF2196f3);
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          fillColor: Colors.white,
          labelStyle: const TextStyle(
            color: Color(0xFF404040),
            fontSize: 14,
          ),
          hintStyle: const TextStyle(
            color: Color(0x66404040),
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
        ),
      ),
      home: const MyHomePage(title: 'GraphQL CRUD Operations'),
      routes: {
        AddUpdateUserScreen.routeName: (_) => const AddUpdateUserScreen(),
        DisplayUser.routeName: (_) => const DisplayUser(),
      },
    );
  }
  }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

            Navigator.of(context).pushNamed(AddUpdateUserScreen.routeName);
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List>(
            future: getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //  here value from api i.e list of user i am showing with list view
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder( //
                      itemCount: snapshot.data?.length, // snapshot.data container value
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1100000D),
                                blurRadius: 16,
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                "# ${snapshot.data?[index]['id']}",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                snapshot.data?[index]['name'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              //  we got 3 action view, edit/update , delete
                              IconButton(
                                onPressed: () {
                                  //  this is view button
                                  //  on click of this we are opening a new screen
                                  //  here i am using named routes
                                  Navigator.of(context).pushNamed(
                                      DisplayUser.routeName, //let's see
                                      arguments: snapshot.data?[index]['id']); // and passing id as argument
                                },
                                icon: const Icon(
                                  Icons.launch_outlined,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  //  on click of edit we are passing id to add user screen  , which we are going to add and update in single screen
                                  Navigator.of(context).pushNamed(
                                      AddUpdateUserScreen.routeName,
                                      arguments: snapshot.data?[index]['id']); // let's see how we handle this
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () async {
                                  var res = await deleteUser(
                                      id: int.parse(
                                          snapshot.data?[index]['id']));
                                  if (res) { // on response if true
                                    snackBar("User deleted", context);
                                    setState(() {}); // this is to refresh data
                                    //  okay let's check

                                  } else {
                                    snackBar("Failed to delete", context);
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }

              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const Center(child: CircularProgressIndicator());
              // }

              return Container();
            }));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}