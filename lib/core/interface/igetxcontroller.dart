import 'package:get/get.dart';

abstract class IGetxController {
  RxBool get isLoading;
  RxList<dynamic> get items;
}
