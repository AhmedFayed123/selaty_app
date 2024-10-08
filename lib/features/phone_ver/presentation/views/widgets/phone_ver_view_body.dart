import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:task1/features/code_screen/presentation/views/code_screen_view.dart';

import '../../../../../utils/custom button.dart';

class PhoneVerViewBody extends StatefulWidget {
  const PhoneVerViewBody({super.key});

  @override
  State<PhoneVerViewBody> createState() => _PhoneVerViewBodyState();
}

class _PhoneVerViewBodyState extends State<PhoneVerViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  String? validatePhone(PhoneNumber? phoneNumber) {
    if (phoneNumber == null || phoneNumber.completeNumber.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    if (!RegExp(r'^\d+$').hasMatch(phoneNumber.completeNumber)) {
      return 'يرجى إدخال رقم هاتف صالح';
    }
    return null;
  }

  void _validateAndProceed() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CodeScreenView()),
      );
    } else {
      // Show an error message if the form is not valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال رقم هاتف صالح')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'لقد ارسلنا لك رسالة نصية قصيرة تحتوى على رمز الى رقم',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '010111111111',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                ),
                initialCountryCode: 'EG',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (phone) {
                  return validatePhone(phone);
                },
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'تأكيد',
                fun: _validateAndProceed,
                color: const Color(0xff16B625),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
