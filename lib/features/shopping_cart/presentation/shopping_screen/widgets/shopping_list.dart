import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 500,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (_) {},
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: const Icon(
              CupertinoIcons.delete,
              color: Colors.white,
              size: 50,
            ),
          ),
          child: const ListItem(),
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 110,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '25.005x2',
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  ),
                  Text(
                    'فراولة مصرى',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '1kg',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _decrementCounter,
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                    Text(
                      '$_counter',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: _incrementCounter,
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
