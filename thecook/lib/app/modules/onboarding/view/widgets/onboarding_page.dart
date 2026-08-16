import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thecook/app/data/onboarding/onboarding_items.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItems items;

  const OnboardingPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            items.imagePath,
            height: Get.height * 0.4,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 40),

          Text(
            items.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Text(
            items.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
