import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onContactTap;

  const HeroSection({super.key, this.onContactTap});

  Future<void> _launch(String urlString) async {
    final trimmed = urlString.trim();
    if (trimmed.isEmpty) return;
    final formatted = (trimmed.startsWith('http://') ||
            trimmed.startsWith('https://') ||
            trimmed.startsWith('mailto:') ||
            trimmed.startsWith('tel:'))
        ? trimmed
        : 'https://$trimmed';
    final uri = Uri.parse(formatted);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 850;

    final introContent = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primaryColor.withOpacity(0.3),
            ),
          ),
          child: Text(
            "👋 Welcome to my portfolio",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioData.name,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isMobile ? 32 : 56,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 12),
        Text(
          PortfolioData.title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: primaryColor,
                fontSize: isMobile ? 18 : 24,
                fontWeight: FontWeight.w600,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          PortfolioData.summary,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.65,
                fontSize: 15,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 32),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 14,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onContactTap ??
                  () => _launch("mailto:${PortfolioData.email}"),
              icon: const Icon(Icons.mail_rounded, size: 20),
              label: const Text(
                "Get In Touch",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _launch(PortfolioData.linkedin),
              icon: const Icon(Icons.link_rounded, size: 20),
              label: const Text("LinkedIn"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                side: BorderSide(
                  color: primaryColor,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            IconButton.filledTonal(
              onPressed: () => _launch(PortfolioData.github),
              icon: const Icon(Icons.code_rounded, size: 22),
              tooltip: "GitHub",
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(14),
              ),
            ),
          ],
        ),
      ],
    );

    final profileImage = Container(
      width: isMobile ? 200 : 320,
      height: isMobile ? 200 : 320,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.8),
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.25),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: ClipOval(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Fallback background with initials
              Container(
                color: Theme.of(context).colorScheme.surface,
                alignment: Alignment.center,
                child: Text(
                  "YN",
                  style: TextStyle(
                    fontSize: isMobile ? 48 : 80,
                    fontWeight: FontWeight.bold,
                    color: primaryColor.withOpacity(0.6),
                  ),
                ),
              ),
              // Profile image from assets
              Image.asset(
                PortfolioData.profileImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.person_rounded,
                      size: isMobile ? 80 : 120,
                      color: primaryColor.withOpacity(0.7),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 8 : 0,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileImage,
                const SizedBox(height: 32),
                introContent,
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 3, child: introContent),
                const SizedBox(width: 48),
                profileImage,
              ],
            ),
    );
  }
}
