import 'package:get/get.dart';
import 'package:task1/features/onboarding/presentation/views/onboarding.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() =>  OnBoarding()); // استخدمنا Get بدلاً من Navigator
    });
  }
}
