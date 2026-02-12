import 'package:flutter/material.dart';
import 'package:spotmatchingsystem/themes/app_textstyle.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class DesignConfidenceView extends StatelessWidget {
  const DesignConfidenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [NavBar(), DesignConfidenceContent(), Footer()],
        ),
      ),
    );
  }
}

class DesignConfidenceContent extends StatelessWidget {
  const DesignConfidenceContent({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Design with Confidence',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 36 : 56,
                      color: const Color(
                        0xFF7A4A3A,
                      ), // Specific dark brown from screenshot
                    ),
              ),
              const SizedBox(height: 48),

              // Section 1: Logo Grid
              Text(
                'SMS colours behave predictably across',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 24),
              _LogoGrid(),
              const SizedBox(height: 60),

              // Section 2: Accurate Sections
              _AccurateSection(),
              const SizedBox(height: 40),
              _FeatureGrid(),
              const SizedBox(height: 20),

              Center(
                child: Text(
                  'Resources',
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile ? 32 : 44,
                        color: AppColors.black,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              _ResourcesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int columns = width < 600 ? 1 : 2;
        double spacing = 16;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            _LogoCard(child: _AdobeLogo()),
            _LogoCard(child: _FigmaLogo()),
            _LogoCard(child: _AffinityLogo()),
            _LogoCard(
              child: const Text(
                'Web',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            _LogoCard(
              child: const Text(
                'Mobile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LogoCard extends StatelessWidget {
  final Widget child;
  const _LogoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      width: isMobile ? double.infinity : (1100 / 2) - 20,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: child),
    );
  }
}

// Logo Widgets (simplified placeholders matched to screenshot)
class _AdobeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.adobe, color: Colors.red, size: 36),
        const SizedBox(width: 8),
        Text(
          'Adobe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class _FigmaLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.palette_outlined, color: Colors.deepPurple, size: 36),
        const SizedBox(width: 8),
        Text(
          'Figma',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _AffinityLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'a',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Affinity',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class _AccurateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Accurate on All Calibrated Screens',
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        Text(
          'Eizo professional monitors → inexpensive office laptops - SMS keeps your colours consistent.',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int columns = width < 600 ? 1 : 3;
        double spacing = 20;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            _FeatureCard(type: 'eco', title: 'Eco- friendly Design Workflow'),
            _FeatureCard(
              type: 'no-guide',
              title: 'Designers do not need Printed Colour Guides',
            ),
            _FeatureCard(
              type: 'waste',
              title: 'Digital approvals Reduce Waste',
            ),
            _FeatureCard(
              type: 'srgb',
              title: 'Work in sRGB until the moment of Print',
            ),
            _FeatureCard(
              type: 'uncoated',
              title:
                  'SMS Colours Print correctly on Uncoated and Recycled Papers',
            ),
          ],
        );
      },
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String type;
  final String title;

  const _FeatureCard({required this.type, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      width: isMobile ? double.infinity : (1100 / 3) - 30,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: CustomPaint(painter: _FeatureIconPainter(type: type)),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureIconPainter extends CustomPainter {
  final String type;
  _FeatureIconPainter({required this.type});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE56A54)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final w = size.width;
    final h = size.height;

    if (type == 'eco') {
      canvas.drawPath(
        Path()
          ..moveTo(w * 0.2, h * 0.8)
          ..quadraticBezierTo(w * 0.8, h * 0.8, w * 0.8, h * 0.2)
          ..quadraticBezierTo(w * 0.2, h * 0.2, w * 0.2, h * 0.8)
          ..moveTo(w * 0.2, h * 0.8)
          ..lineTo(w * 0.5, h * 0.5),
        paint,
      );
    } else if (type == 'no-guide') {
      canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.4, paint);
      canvas.drawLine(
        Offset(w * 0.3, h * 0.3),
        Offset(w * 0.7, h * 0.7),
        paint,
      );
      canvas.drawLine(
        Offset(w * 0.7, h * 0.3),
        Offset(w * 0.3, h * 0.7),
        paint,
      );
    } else if (type == 'waste') {
      canvas.drawPath(
        Path()
          ..moveTo(w * 0.5, h * 0.1)
          ..lineTo(w * 0.8, h * 0.4)
          ..lineTo(w * 0.5, h * 0.9)
          ..lineTo(w * 0.2, h * 0.4)
          ..close(),
        paint,
      );
    } else if (type == 'srgb') {
      canvas.drawRect(Rect.fromLTWH(w * 0.2, h * 0.2, w * 0.6, h * 0.6), paint);
      canvas.drawCircle(
        Offset(w * 0.5, h * 0.5),
        2,
        paint..style = PaintingStyle.fill,
      );
    } else if (type == 'uncoated') {
      canvas.drawRect(Rect.fromLTWH(w * 0.2, h * 0.2, w * 0.5, h * 0.7), paint);
      canvas.drawRect(Rect.fromLTWH(w * 0.4, h * 0.3, w * 0.5, h * 0.7), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ResourcesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ResourceLink(title: 'When and why SMS is a good Idea?'),
        _ResourceLink(title: 'SMS training videos and webinars'),
        _ResourceLink(title: 'SMS READY control strips'),
        _ResourceLink(title: 'Supported ICC profiles (coming soon)'),
        _ResourceLink(title: 'Deep -dive PDFs (coming soon)'),
      ],
    );
  }
}

class _ResourceLink extends StatelessWidget {
  final String title;
  const _ResourceLink({required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(
            width: isMobile ? 24 : 32,
            height: isMobile ? 24 : 32,
            child: Image.asset(
              "assets/images/arrowimg.png",
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE56A54),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_outward,
                    color: Color(0xFFE56A54),
                    size: 14,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
