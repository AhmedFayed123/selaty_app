
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

class RankingStepper extends StatelessWidget {
  RankingStepper({super.key});

  final steps = [
    StepperData(
      iconWidget: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green[50],
        ),
        child: const Icon(
          Icons.account_balance_sharp,
          color: Colors.green,
        ),
      ),
      title: StepperText(
        'تم الطلب',
        textStyle: const TextStyle(fontSize: 25, color: Colors.green),
      ),
      subtitle: StepperText(
        'jun 26 2021',
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green[50],
        ),
        child: const Icon(
          Icons.account_balance_sharp,
          color: Colors.green,
        ),
      ),
      title: StepperText(
        'order',
        textStyle: const TextStyle(fontSize: 25, color: Colors.green),
      ),
      subtitle: StepperText(
        'jun 26 2021',
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green[50],
        ),
        child: const Icon(
          Icons.account_balance_sharp,
          color: Colors.green,
        ),
      ),
      title: StepperText(
        'تم شحن الطلب',
        textStyle: const TextStyle(fontSize: 25, color: Colors.green),
      ),
      subtitle: StepperText(
        'jun 26 2021',
      ),
    ),
    StepperData(
      iconWidget: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[50],
        ),
        child: const Icon(
          Icons.account_balance_sharp,
          color: Colors.grey,
        ),
      ),
      title: StepperText(
        'خارج الخدمة',
        textStyle: const TextStyle(
          fontSize: 25,
        ),
      ),
      subtitle: StepperText(
        'قيد الانتظار',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AnotherStepper(
          stepperList: steps,
          stepperDirection: Axis.vertical,
          iconWidth: 40,
          iconHeight: 40,
          activeBarColor: Colors.green,
          inActiveBarColor: Colors.grey,
          activeIndex: 2, // Change this to indicate the active step
        ),
      ),
    );
  }
}
