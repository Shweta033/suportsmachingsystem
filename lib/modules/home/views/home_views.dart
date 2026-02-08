import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/status_section.dart';
import 'widgets/why_choosesection.dart';
import 'widgets/explore_section.dart';
import 'widgets/pricing_section.dart';
import 'widgets/footer_dart.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            HeroSection(),
            StatsSection(),
            WhyChooseSection(),
            ExploreSection(),
            PricingSection(),
            Divider(color: Colors.brown.shade200),
            SizedBox(height: 15),
            Footer(),
          ],
        ),
      ),
    );
  }
}
