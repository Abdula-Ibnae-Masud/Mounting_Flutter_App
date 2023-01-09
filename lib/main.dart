import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/app_cubit_logics.dart';
import 'package:myapp/cubit/app_cubits.dart';
import 'package:myapp/services/data_servies.dart';
//import 'package:myapp/pages/detail_page.dart';
//import 'package:myapp/pages/navpages/main_page.dart';
//import 'package:myapp/pages/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Mounting App',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=> AppCubits(
          data: DataServices(), // To import http data
        ),
        child: const AppCubitLogics(),
        )
    );
  }
}

