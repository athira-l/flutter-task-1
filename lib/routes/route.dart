import 'package:get/get.dart';
import 'package:training_1/bindings/databinding.dart';
import 'package:training_1/data.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/data',
      page: () => Data(),
      binding: DataBinding(),
    ),
  ];
}
