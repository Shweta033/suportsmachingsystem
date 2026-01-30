import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../themes/app_colors.dart';
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
                /// LOGO (LEFT)
                SizedBox(
                  width: 140,
                  height: 40,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => _LogoPlaceholder(),
                  ),
                ),

                const SizedBox(width: 16),

                /// MENU ITEMS + SHOP BUTTON (desktop)
                if (!Responsive.isMobile(context))
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, innerConstraints) {
                        final navWidth = innerConstraints.maxWidth;
                        const minNavWidth = 400.0;
                        if (navWidth < minNavWidth) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const NavItem('What is SMS'),
                                const SizedBox(width: 16),
                                const NavItem('Colour System'),
                                const SizedBox(width: 16),
                                const NavItem('Why Choose SMS'),
                                const SizedBox(width: 16),
                                const NavItem('For Designers'),
                                const SizedBox(width: 24),
                                _ShopButton(),
                              ],
                            ),
                          );
                        }
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Wrap(
                                spacing: 24,
                                runSpacing: 8,
                                alignment: WrapAlignment.end,
                                children: const [
                                  NavItem('What is SMS'),
                                  NavItem('Colour System'),
                                  NavItem('Why Choose SMS'),
                                  NavItem('For Designers'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            _ShopButton(),
                          ],
                        );
                      },
                    ),
                  )
                else
                  const Spacer(),
                if (Responsive.isMobile(context)) ...[
                  _ShopButton(),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: controller.toggleMenu,
                  ),
                ],
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

class _LogoPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Center(
            child: Text(
              'S',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SPOT',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            Text(
              'matching system',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ShopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.buttonText,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      onPressed: () {},
      child: const Text(
        'Shop SMS',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

