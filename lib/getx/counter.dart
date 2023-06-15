import 'package:get/get.dart';

class Counter extends GetxController {
  var count = [];

  get onPageChanged => null;

  changeIcons(List icons) {
    count = icons;
    update();
  }
}
