import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFEFF3F6), // Matches the screenshot background
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              if (isMobile)
                Column(
                  children: [
                    const _FooterLeft(),
                    const SizedBox(height: 48),
                    const _FooterRight(),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(flex: 1, child: _FooterLeft()),
                    SizedBox(width: 48),
                    Expanded(flex: 1, child: _FooterRight()),
                  ],
                ),
              const SizedBox(height: 80),
              // Bottom Links
              _BottomLinks(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLeft extends StatelessWidget {
  const _FooterLeft();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo Section
        const _FooterLogo(),
        const SizedBox(height: 32),
        // Follow Card
        const _FollowNewsCard(),
      ],
    );
  }
}

class _FooterLogo extends StatelessWidget {
  const _FooterLogo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color Bars
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _colorBar(Colors.black),
            _colorBar(const Color(0xFF7CB9E8)),
            _colorBar(const Color(0xFFED2939)),
            _colorBar(const Color(0xFFFFD700)),
            _colorBar(const Color(0xFF00FF7F)),
            _colorBar(const Color(0xFF915C83)),
            _colorBar(const Color(0xFFF4C2C2)),
            _colorBar(const Color(0xFFDAA520)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'S P O T',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w300,
                color: Color(0xFF8A4D3D),
                letterSpacing: 4,
              ),
            ),
          ],
        ),
        const Text(
          'matching system',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8A4D3D),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _colorBar(Color color) {
    return Container(
      width: 14,
      height: 6,
      margin: const EdgeInsets.only(right: 2),
      color: color,
    );
  }
}

class _FollowNewsCard extends StatelessWidget {
  const _FollowNewsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFE5876F),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            // Image Part
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/ballongirlimg.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[200]),
              ),
            ),
            // Text Part
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Follow SMS News Page',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => _launchURL(
                        'https://www.linkedin.com/company/spotnordic/',
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.north_east, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterRight extends StatelessWidget {
  const _FooterRight();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SpotNordic',
          style: AppTextStyles.h3.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 28,
            color: const Color(0xFF4A4A4A),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manufacturer of the Spot Matching System',
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () => _launchURL('https://www.spot-nordic.com'),
          child: Text(
            'www.spot-nordic.com',
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF8A4D3D),
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
            children: [
              const TextSpan(text: 'Support- '),
              WidgetSpan(
                child: InkWell(
                  onTap: () =>
                      _launchURL('mailto:support@spotmatchingsystem.com'),
                  child: Text(
                    'support@spotmatchingsystem.com',
                    style: TextStyle(
                      color: const Color(0xFFE5876F),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // LinkedIn Icon
        IconButton(
          onPressed: () =>
              _launchURL('https://www.linkedin.com/company/spotnordic/'),
          icon: Icon(
            CupertinoIcons.link_circle,
            color: Color(0xFF0077B5),
            size: 36,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}

class _BottomLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final links = ['SMS vs Pantone', 'Legal', 'Terms', 'Privacy'];
    return Wrap(
      alignment: WrapAlignment.end,
      spacing: 32,
      children: links
          .map(
            (link) => InkWell(
              onTap: () {},
              child: Text(
                link,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
