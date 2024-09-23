import 'package:flutter/material.dart';

class ChanceList extends StatelessWidget {
  const ChanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          childAspectRatio: 3 / 2,
          crossAxisCount: 1,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) => const ListItem(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card.filled(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'الخضار',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        'بحد ادنى 57% خصم',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                child: Image.asset(
                  'assets/images/fruits.png',
                  fit: BoxFit.fill,
                  cacheWidth: 250,
                  cacheHeight: 200, // Replace with your image URL
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 50,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          right: 20,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
