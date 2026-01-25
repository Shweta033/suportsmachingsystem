import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utills/responsive.dart';
import '../../controllers/home_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        children: [
          /// LOGO
          const Text(
            'DOT',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          // const Spacer(),

          /// MENU
          if (!Responsive.isMobile(context))
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  alignment: WrapAlignment.end,
                  children: [
                    NavItem('What is SMS'),
                    NavItem('Colour System'),
                    NavItem('Why Choose SMS'),
                    NavItem('For Designers'),
                  ],
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: controller.toggleMenu,
            ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  const NavItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(6),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
