import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print('Fetched Profile: ${fetchedProfile.name}');

      profile(fetchedProfile);

      if (fetchedProfile.name.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isSaved = await prefs.setString('name', fetchedProfile.name);
        print('Name saved: $isSaved');
      } else {
        print('Name is empty, not saving to SharedPreferences');
      }

    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile');
    } finally {
      isLoading(false);
    }
  }

  Future<String?> getNameFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString('name');
    print('Stored Name: $storedName');
    return storedName;
  }
}
