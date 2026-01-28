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
    final controller = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LOGO IMAGE (LEFT)
          Image.asset(
            'assets/images/logo.png', // <-- your logo path
            height: 32,
            fit: BoxFit.contain,
          ),

          const Spacer(),

          /// MENU ITEMS (DESKTOP / WEB)
          if (!Responsive.isMobile(context))
            Wrap(
              spacing: 24,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                NavItem('What is SMS'),
                NavItem('Colour System'),
                NavItem('Why Choose SMS'),
                NavItem('For Designers'),
              ],
            )
          else
          /// MOBILE MENU ICON
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
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}

