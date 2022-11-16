import 'package:get/get.dart';
import 'package:training_1/provider/provider.dart';

class DataController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    Provider().getUser().then((value) {
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

class DataController1 extends GetxController with StateMixin<dynamic> {
  late int id;

  DataController1({required this.id}) {
    id = id;
  }

  @override
  void onInit() {
    super.onInit();
    Provider().getUserDetail(id).then((value) {
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
