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

    final horizontalPadding = Responsive.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// LOGO IMAGE (LEFT) - fixed size, won't grow
                SizedBox(
                  width: 140,
                  height: 40,
                  child: Image.asset(
                    'assets/images/smslogoimage.png',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),

                const SizedBox(width: 16),

                /// MENU ITEMS - take remaining space and wrap, or scroll if needed
                if (!Responsive.isMobile(context))
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, innerConstraints) {
                        final navWidth = innerConstraints.maxWidth;
                        // If nav items don't fit in one row, use horizontal scroll
                        const minNavWidth = 400.0; // ~4 items * ~100px
                        if (navWidth < minNavWidth) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                NavItem('What is SMS'),
                                SizedBox(width: 16),
                                NavItem('Colour System'),
                                SizedBox(width: 16),
                                NavItem('Why Choose SMS'),
                                SizedBox(width: 16),
                                NavItem('For Designers'),
                              ],
                            ),
                          );
                        }
                        return Wrap(
                          spacing: 24,
                          runSpacing: 8,
                          alignment: WrapAlignment.end,
                          children: const [
                            NavItem('What is SMS'),
                            NavItem('Colour System'),
                            NavItem('Why Choose SMS'),
                            NavItem('For Designers'),
                          ],
                        );
                      },
                    ),
                  )
                else
                  const Spacer(),
                if (Responsive.isMobile(context))
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: controller.toggleMenu,
                  ),
              ],
            ),
          );
        },
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

