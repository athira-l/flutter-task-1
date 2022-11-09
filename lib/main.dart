import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_1/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: '/data', getPages: Routes.routes);
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.avatar});

  final String name, email, avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Image.network(avatar, width: 150.0, height: 150.0),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Text(name, style: const TextStyle(fontSize: 20)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                child: Text('Email : $email',
                    style: const TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
