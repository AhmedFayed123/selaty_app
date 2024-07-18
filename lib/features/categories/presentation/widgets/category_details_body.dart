import 'package:flutter/material.dart';
import 'package:task1/features/categories/presentation/widgets/category_details_app_bar.dart';
import 'package:task1/features/categories/presentation/widgets/category_details_list.dart';

import '../../../home_screen/presentation/widgets/search_bar.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const CategoryDetailsAppBar(),
              Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: CustomSearchBar(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.menu,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: CategoryDetailsList(),
              )
            ],
          ),
          Container(
            height: 400,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white.withOpacity(.6),
                    width: 8,
                  ),
                ),
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/fruit_icon.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
