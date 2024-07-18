import 'package:flutter/material.dart';
import 'package:task1/features/categories/presentation/categories.dart';
import 'package:task1/features/home_screen/presentation/widgets/sales_list.dart';
import 'package:task1/features/home_screen/presentation/widgets/search_bar.dart';
import 'package:task1/features/home_screen/presentation/widgets/the_best_list.dart';
import 'chance_list.dart';
import 'fast_grid_view.dart';
import 'grid_list.dart';
import 'offer_grid_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: CustomSearchBar(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Icon(
                    //       Icons.arrow_back,
                    //       size: 20.0,
                    //       color: Colors.white,
                    //     ),
                    //     Icon(
                    //       Icons.arrow_forward,
                    //       size: 20.0,
                    //       color: Colors.white,
                    //     ),
                    //   ],
                    // ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مشاهدة الكل >',
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      'اعلى مبيعات\t\t',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'القيمة الافضل',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const TheBestList(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Categories(),
                      ),
                    );
                  },
                  child: const Text(
                    'مشاهدة الكل >',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Text(
                  'التصنيفات',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SalesList(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مشاهدة الكل >',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'الاكثر مبيعا',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const GridList(),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/fruits_img.jpg',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مشاهدة الكل >',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'تسوق حسب العرض',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const OfferGridList(),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'طازج وسريع',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const FastGridView(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/fruits_img.jpg',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const ChanceList(),
          ],
        ),
      ),
    );
  }
}
