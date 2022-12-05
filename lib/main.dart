import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc/movie_bloc.dart';
import 'package:movie_app/presentation/pages/main_page.dart';
import 'package:movie_app/presentation/pages/sign_in_page.dart';
import 'package:movie_app/presentation/pages/sign_up_page.dart';
import 'package:movie_app/presentation/pages/splash_page.dart';
import 'package:movie_app/presentation/pages/wrapper.dart';
import 'package:movie_app/repository/auth_services.dart';
import 'package:movie_app/services/database_services.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc/page_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,

      initialData: null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => MovieBloc()..add(FetchMovies())),
        ],
        child: MaterialApp(
          home: Wrapper(),
          debugShowCheckedModeBanner: false,
        ),
      ),

      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("Firestore Demo"),
      //   ),
      //   body: Container(
      //     child: Center(
      //       child: Column(
      //         children: [
      //           ElevatedButton(
      //               onPressed: () {
      //                 DatabaseServices.createUser(
      //                     fullName: "Abed",
      //                     email: "abed@gmail.com",
      //                     password: "tes");
      //               },
      //               child: Text("Add Data"))
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
