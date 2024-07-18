import 'package:flutter/material.dart';
import 'package:task1/features/categories/presentation/category_details.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 2 / 3,
      ),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => const ListItem(),
    );
  }
}


class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const CategoryDetails(),),);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                width: 300,
                height: 110,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'خضروات',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/fruits_img.jpg',
                  width: 300,
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child:Container(
                  color: Colors.orange,
                  child: Image.asset(
                    'assets/images/category_icon.png',
                    color: Colors.white,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
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
