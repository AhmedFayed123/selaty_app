import 'package:flutter/material.dart';
import 'package:task1/features/favorite/presentation/view/widgets/favorite_list_screen.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: FavoriteListScreen());
  }
}
