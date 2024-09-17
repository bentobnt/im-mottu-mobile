// ignore: depend_on_referenced_packages
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class BaseController extends GetxController with AnalyticsMixin {
  void backPage() {
    Get.back();
  }
}
