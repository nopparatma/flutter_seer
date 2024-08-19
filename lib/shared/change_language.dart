import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.updateLocale(const Locale('th', 'TH'));
          },
          child: const Text('Switch to Thai'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.updateLocale(const Locale('en', 'US'));
          },
          child: const Text('Switch to English'),
        ),
      ],
    );
  }
}
