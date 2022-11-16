import 'package:get/get.dart';

class Provider extends GetConnect{
final String _baseUrl="https://reqres.in/api";
  Future<List<dynamic>> getUser() async{
    final response = await get('$_baseUrl/users?per_page=12');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return response.body['data'];
    }
  }
  Future<dynamic> getUserDetail(int id) async {
    final response = await get('$_baseUrl/users/$id');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}