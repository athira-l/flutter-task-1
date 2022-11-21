import 'package:get/get.dart';
import 'package:training_1/provider/provider.dart';

class UserListController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    Provider().getUserList().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

class UserDetailsController extends GetxController with StateMixin<dynamic> {
  late int id;

  UserDetailsController({required this.id}) {
    id = id;
  }

  @override
  void onInit() {
    super.onInit();
    Provider().getUserDetails(id).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
