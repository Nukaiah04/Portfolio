import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final Map<String, dynamic> experience;

  const ExperienceItem({super.key, required this.experience});

  Widget _buildRichBullet(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    // Pattern to match either **markdown bold** or specific key tools
    final keyTerms = [
      "Kubernetes",
      "Prometheus & Grafana",
      "Prometheus",
      "Grafana",
      "GitHub Actions",
      "Terraform",
      "Docker",
      "GCP",
      "Alertmanager",
      "Trivy",
      "SonarQube",
      "99.9% uptime",
      "MTTD",
      "MTTS",
      "MTTR",
    ];

    // If text already has **bold**, parse markdown
    if (text.contains('**')) {
      final spans = <TextSpan>[];
      final regex = RegExp(r'\*\*(.*?)\*\*');
      int lastMatchEnd = 0;

      for (final match in regex.allMatches(text)) {
        if (match.start > lastMatchEnd) {
          spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
        }
        spans.add(TextSpan(
          text: match.group(1),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? const Color(0xFF38BDF8) : primaryColor,
          ),
        ));
        lastMatchEnd = match.end;
      }
      if (lastMatchEnd < text.length) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd)));
      }

      return RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                height: 1.6,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
              ),
          children: spans,
        ),
      );
    }

    // Otherwise automatically highlight key terms
    final escapedTerms = keyTerms.map(RegExp.escape).join('|');
    final regex = RegExp('($escapedTerms)', caseSensitive: false);
    final spans = <TextSpan>[];
    int lastEnd = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(0),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? const Color(0xFF38BDF8) : primaryColor,
        ),
      ));
      lastEnd = match.end;
    }
    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              height: 1.6,
              color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
            ),
        children: spans,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final bullets = List<String>.from(experience['bullets'] ?? []);

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 20 : 28),
      padding: EdgeInsets.all(isMobile ? 18 : 26),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111827) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Role Header & Company Metadata
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.work_rounded,
                      size: 20,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience['role'] ?? '',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: isMobile ? 18 : 20,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : const Color(0xFF0F172A),
                              ),
                        ),
                        const SizedBox(height: 4),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.business_rounded,
                                  size: 15,
                                  color: primaryColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  experience['company'] ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "•   ${experience['location'] ?? ''}",
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Duration Pill Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 13,
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      experience['duration'] ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Divider(
            color: isDark
                ? const Color(0xFF1E293B).withOpacity(0.8)
                : const Color(0xFFE2E8F0),
            height: 1,
          ),
          const SizedBox(height: 18),

          // Bullet Points with Scannable Bold Tools
          ...bullets.map((bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, right: 10.0),
                      child: Icon(
                        Icons.check_circle_rounded,
                        size: 16,
                        color: primaryColor,
                      ),
                    ),
                    Expanded(
                      child: _buildRichBullet(context, bullet),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
