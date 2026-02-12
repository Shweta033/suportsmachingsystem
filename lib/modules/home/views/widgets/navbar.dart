import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotmatchingsystem/modules/home/smsReady/widgets/about_view.dart';
import 'package:spotmatchingsystem/modules/home/smsReady/widgets/smsready_view.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utills/responsive.dart';
import '../../controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../smsReady/widgets/colorSystem_view.dart';
import '../../smsReady/widgets/fordesign_view.dart';
import '../../smsReady/widgets/support_view.dart';
import '../../smsReady/widgets/sustainability_view.dart';
import '../../smsReady/widgets/whatIsSms_View.dart';
import '../home_views.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    final horizontalPadding = Responsive.horizontalPadding(context);

    final currentRoute = Get.currentRoute;
    final initialIndex = _navTabs.indexWhere(
      (tab) => tab.route == currentRoute,
    );
    if (initialIndex != -1) {
      controller.currentIndex.value = initialIndex;
    }

    return Obx(
      () => DefaultTabController(
        length: _navTabs.length,
        initialIndex: controller.currentIndex.value,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 20,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = Responsive.isMobile(context);

              return SizedBox(
                width: constraints.maxWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// LOGO (LEFT)
                        GestureDetector(
                          onTap: () => Get.offAllNamed(AppRoutes.home),
                          child: SizedBox(
                            width: 140,
                            height: 40,
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => _LogoPlaceholder(),
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        /// MENU TABS + SHOP BUTTON (desktop)
                        if (!isMobile)
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(child: _NavTabs()),
                                const SizedBox(width: 24),
                                _ShopButton(),
                              ],
                            ),
                          )
                        else
                          const Spacer(),
                        if (isMobile) _ShopButton(),
                      ],
                    ),
                    if (isMobile) ...[const SizedBox(height: 12), _NavTabs()],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavTab {
  final String title;
  final dynamic route;

  const _NavTab(this.title, {this.route});
}

class _NavTabs extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.black54,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
      dividerColor: Colors.transparent,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
      tabs: _navTabs.map((tab) => Tab(text: tab.title)).toList(),
      onTap: (index) {
        final route = _navTabs[index].route;
        if (route != null) {
          if (route is String) {
            if (Get.currentRoute != route) {
              Get.offAllNamed(route);
            }
          } else if (route is Widget) {
            Get.to(() => route);
          }
        }
      },
    );
  }
}

const List<_NavTab> _navTabs = [
  _NavTab('What is SMS', route: WhatIsSmsView()),
  _NavTab('Colour System', route: ColourSystemView()),
  _NavTab('SMS Ready', route: SmsReadyExpertView()),
  _NavTab('For Designers', route: DesignConfidenceView()),
  _NavTab('For Brands'),
  _NavTab('Sustainability', route: SustainabilityView()),
  _NavTab('About', route: AboutView()),
  _NavTab('Support', route: SupportView()),
];

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
      onPressed: () {
        Get.toNamed(AppRoutes.shopView);
      },
      child: const Text(
        'Shop SMS',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
