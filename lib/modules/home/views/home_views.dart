import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotmatchingsystem/modules/home/views/widgets/footer_dart.dart';
import 'package:spotmatchingsystem/modules/home/views/widgets/status_section.dart';
import '../controllers/home_controller.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';

import 'widgets/pricing_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            SizedBox(height: 40),
            HeroSection(),
            StatsSection(),
            // WhyChooseSection(),
            // ExploreSection(),
            PricingSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
