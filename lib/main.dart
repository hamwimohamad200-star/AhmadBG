import 'package:ahmad_bg/cubit/get_data_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

void main() {
  final Dio dio = Dio();
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dio});

  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDataCubit(dio: dio),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Api Get',
        home: HomePage(dio: dio,),
      ),
    );
  }
}

