import 'package:flutter/material.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width > 700 ?300:500,
      width: MediaQuery.of(context).size.width > 700 ? 600 : 500,
      child: MediaQuery.of(context).size.width > 700
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 7,
              ),
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ListItem(),
            )
          : ListView.builder(
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ListItem(),
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
  int? selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.more_horiz),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.lightGreen[50],
                      height: 25,
                      width: 50,
                      child: const Text(
                        'افتراضى',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'المنزل',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Radio(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          'البر الشرقى _ شبين الكوم',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          ' المنوفية _ مصر_',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'جوال:1234567899',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
