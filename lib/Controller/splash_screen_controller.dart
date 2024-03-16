import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splashHandle();
  }

  Future<void> splashHandle() async {
    await Future.delayed(const Duration(seconds: 3)); // Add await here
    if (auth.currentUser == null) {
      Get.offAllNamed("/authPage");
    } else {
      Get.offAllNamed("/homePage");
    }
  }
}
