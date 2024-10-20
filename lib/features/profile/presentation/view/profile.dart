import 'package:flutter/material.dart';
import 'package:task1/features/profile/presentation/view/widgets/profile_body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}
