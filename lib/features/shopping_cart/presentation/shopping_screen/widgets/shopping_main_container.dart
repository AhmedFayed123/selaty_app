import 'package:flutter/material.dart';

class ShoppingMainContainer extends StatelessWidget {
  const ShoppingMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width<700?Container(
      height: 135,
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '4',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$100.00',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Free',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height:15,),
                Text(
                  '100.00\t\tSAR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'البنود',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'المجموع الفرعى',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'رسوم التوصيل',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height:15,),
                Text(
                  'الاجمالى',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ):Container(
      height: 200,
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '4',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$100.00',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Free',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height:70,),
                Text(
                  '100.00\t\tSAR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'البنود',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'المجموع الفرعى',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'رسوم التوصيل',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height:70,),
                Text(
                  'الاجمالى',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
