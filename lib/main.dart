import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training_1/controller/datacontroller.dart';
import 'package:training_1/data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'training_1';

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffc3d898),
              Color(0xff89cc8f),
              Color(0xff3fb5b7),
            ])),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  'Member Login',
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 38,
                      fontFamily: 'Antipasto',
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 150, maxWidth: 200),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff40B5AD),
                    fontFamily: 'Arsenal',
                    fontWeight: FontWeight.w200),
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Color(0xff40B5AD),
                  ),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Username',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xff40B5AD),
                      fontFamily: 'Arsenal',
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 150, maxWidth: 200),
              margin: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: TextField(
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff40B5AD),
                    fontFamily: 'Arsenal',
                    fontWeight: FontWeight.w200),
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xff40B5AD),
                  ),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xff40B5AD),
                      fontFamily: 'Arsenal',
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 150, maxWidth: 240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: _isChecked,
                        fillColor:
                            MaterialStateProperty.all(const Color(0x00ffffff)),
                        shape: const CircleBorder(),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              const BorderSide(width: 1.0, color: Colors.white),
                        ),
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue!;
                          });
                        },
                      ),
                    ),
                    const Text('Remember me',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontFamily: 'Antipasto',
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600)),
                  ]),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                    ),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.transparent,
                          shadows: [
                            Shadow(offset: Offset(0, -3), color: Colors.white)
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontSize: 11,
                          letterSpacing: 0.5,
                          fontFamily: 'Antipasto',
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                width: 200,
                height: 40,
                margin: const EdgeInsets.all(0),
                child: TextButton(
                  /*style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x1a3fb5b7)),*/
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xcc54a484))),
                  onPressed: () {
                    if (_nameController.text.compareTo("admin") == 0 &&
                        _passwordController.text.compareTo("password") == 0) {
                      Get.to(const UserListScreen());
                    } else {
                      Get.snackbar(
                        "",
                        "Invalid username/password",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0x00ffffff),
                        colorText: Colors.white,
                      );
                      /*ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Invalid username/password"),
                          ));*/
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontFamily: 'Antipasto',
                        fontWeight: FontWeight.w600),
                  ),
                )),
          ],
        )));
  }
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Data(),
    );
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
