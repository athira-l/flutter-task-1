import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_1/controller/datacontroller.dart';
import 'package:training_1/data.dart';
import 'package:training_1/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/data',
        getPages: Routes.routes);
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    Get.put(id);
    Get.lazyPut(() => DataController1(id: id));

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Data1(),
    );
  }
}
