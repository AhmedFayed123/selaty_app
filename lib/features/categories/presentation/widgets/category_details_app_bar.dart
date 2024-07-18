import 'package:flutter/material.dart';

class CategoryDetailsAppBar extends StatelessWidget {
  const CategoryDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(36),
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.green
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Icon(
                Icons.archive_outlined,
                size: 20,
              ),
            ),
            const Center(
              child: Text(
                'التصنيفات',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
