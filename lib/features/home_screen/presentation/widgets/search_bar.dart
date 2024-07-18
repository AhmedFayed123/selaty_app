import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            hintText: "ابحث عن المنتجات",
            suffixIcon: const Icon(Icons.close),
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
