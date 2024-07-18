import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/images/category_icon.png',
              color: Colors.black,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'معرف الطلب:',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '#oDzzq4',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Text(
                'تاريخ النشر 26 كانون التانى(يناير)2021',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الاجمالى:500 ريال',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'البنود:15',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
