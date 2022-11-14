import 'package:get/get.dart';

class Provider extends GetConnect{

  Future<List<dynamic>> getUser() async{
    final response = await get('https://reqres.in/api/users?per_page=12');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return response.body['data'];
    }
  }
}