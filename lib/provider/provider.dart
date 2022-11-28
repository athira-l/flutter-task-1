import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class Provider extends GetConnect {
  final String _baseUrl = "https://reqres.in/api";

  void login(Map data) async {
    final response = await post('$_baseUrl/login', data);
    // print("body ${json.encode(response.body)}");
    if (response.statusCode == 200) {
      Get.to(const UserListScreen());
    } else {
      Get.snackbar(
        "",
        "Invalid username/password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0x00ffffff),
        colorText: Colors.red,
      );
    }
  }

  Future<List<dynamic>> getUserList() async {
    final response = await get('$_baseUrl/users?per_page=12');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['data'];
    }
  }

  Future<dynamic> getUserDetails(int id) async {
    final response = await get('$_baseUrl/users/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
