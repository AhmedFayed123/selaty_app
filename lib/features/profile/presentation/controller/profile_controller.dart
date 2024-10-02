import 'package:get/get.dart';

import '../../../../services/auth_service.dart';
import '../../models/profile_model.dart';


class ProfileController extends GetxController {
  var isLoading = true.obs;
  var profile = ProfileModel(name: '', email: '').obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      isLoading(true);
      ProfileModel fetchedProfile = await ProfileApiService().fetchProfile();
      profile(fetchedProfile);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile');
    } finally {
      isLoading(false);
    }
  }
}
