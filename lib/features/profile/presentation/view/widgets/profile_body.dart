import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/features/profile/presentation/view/widgets/profile_row.dart';

import '../../controller/profile_controller.dart';
import 'grid_list.dart';

class ProfileBody extends StatelessWidget {

  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return Obx(() {
      if (profileController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ),
                        ),
                        const Icon(
                          Icons.archive_outlined,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Container(
                      height: 150,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              profileController.profile.value.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              profileController.profile.value.email,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width > 420 ? 500 : 360,
                      width: 450,
                      child: const ProfileGridList(), // يمكنك إضافة محتوى هنا
                    ),
                    const SizedBox(
                      width: 450,
                      child: ProfileRow(), // يمكنك إضافة محتوى هنا
                    ),
                  ],
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.white.withOpacity(.6),
                              width: 7,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: profileController.profile.value.profileImage != null
                              ? Image.network(
                            profileController.profile.value.profileImage!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            'assets/images/profile.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 130,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
