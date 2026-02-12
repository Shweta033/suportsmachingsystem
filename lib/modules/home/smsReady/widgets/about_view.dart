import 'package:flutter/material.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F6),
      body: SingleChildScrollView(
        child: Column(children: const [NavBar(), AboutContent(), Footer()]),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About SpotNordic',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 36 : 56,
                      color: const Color(0xFF8A4D3D),
                    ),
              ),
              const SizedBox(height: 18),

              // Intro Text
              _IntroText(
                text:
                    'SpotNordic develops, distributes, and markets cutting edge colour systems and tools that ensure colour consistency across print, digital, mobile, and everyday screens.',
              ),
              const SizedBox(height: 32),
              _IntroText(
                text:
                    'We are the manufacturer of the Spot Matching System (SMS) and a reseller for leading manufacturers in the global graphics industry.',
              ),
              const SizedBox(height: 48),

              _MissionBox(),
              const SizedBox(height: 28),

              Text(
                'SpotNordic is based in Iceland and collaborates with partners worldwide.',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 60),

              // Divider
              Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
              const SizedBox(height: 60),

              const _ContactSection(), const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroText extends StatelessWidget {
  final String text;
  const _IntroText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.body.copyWith(
        fontSize: 16,
        height: 1.3,
        fontWeight: FontWeight.w500,
        color: AppColors.black.withOpacity(0.85),
      ),
    );
  }
}

class _MissionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF8B5A4E), // Dark rust brown from screenshot
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Mission',
            style: AppTextStyles.h2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'To make colour predictable, accessible, and consistent - everywhere.',
            style: AppTextStyles.body.copyWith(
              color: Colors.white.withOpacity(0.95),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact information',
          style: AppTextStyles.h2.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 42,
            color: const Color(0xFF4A4A4A),
          ),
        ),
        const SizedBox(height: 32),

        // Website Row
        _ContactRow(
          label: 'Website: ',
          value: 'www.spot-nordic.com',
          isLink: true,
        ),
        const SizedBox(height: 16),

        // Email Row
        _ContactRow(
          label: 'E-mail: ',
          value: 'Support@spotmatchingsystem.com',
          isLink: true,
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLink;

  const _ContactRow({
    required this.label,
    required this.value,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.body.copyWith(
          color: const Color(0xFF4A4A4A),
          fontSize: 18,
        ),
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: isLink ? const Color(0xFF8B4D3E) : const Color(0xFF4A4A4A),
              decoration: isLink
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
