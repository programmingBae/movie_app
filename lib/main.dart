import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/services/database_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firestore Demo"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      DatabaseServices.createUser(
                          fullName: "Abed",
                          email: "abed@gmail.com",
                          password: "tes");
                    },
                    child: Text("Add Data"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
