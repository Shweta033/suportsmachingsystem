import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utills/responsive.dart';
import '../../controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';
import 'explore_section.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    final horizontalPadding = Responsive.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 20,
      ),
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
                                NavItem(
                                  'What is SMS',
                                  // onTap: () => Get.toNamed(AppRoutes.),
                                ),
                                const SizedBox(width: 16),
                                NavItem(
                                  'Colour System',
                                  // onTap: () =>
                                  // Get.toNamed(AppRoutes.ExploreSection),
                                ),
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
                                children: [
                                  NavItem(
                                    'What is SMS',
                                    onTap: () =>
                                        Get.toNamed(AppRoutes.WhatIsSmsView),
                                  ),
                                  NavItem(
                                    'Colour System',
                                    // onTap: () =>
                                    // Get.toNamed(AppRoutes.colourSystem),
                                  ),
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
  final VoidCallback? onTap;

  const NavItem(this.title, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final text = Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );

    if (onTap == null) return text;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: text,
        ),
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
              style: TextStyle(fontSize: 10, color: AppColors.textLight),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
      ),
      onPressed: () {},
      child: const Text(
        'Shop SMS',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
