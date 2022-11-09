import 'package:get/get.dart';
import 'package:training_1/controller/datacontroller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }

}
