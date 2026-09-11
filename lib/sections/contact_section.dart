import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Contact Details"),
          Text(
            "I'm currently open to Full Stack Developer & Mobile Developer roles. Feel free to reach out directly through any of the channels below!",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 700;

              return Column(
                children: [
                  // Main Contact Cards Grid / Column
                  if (isNarrow) ...[
                    _buildContactCard(
                      context,
                      icon: Icons.email_rounded,
                      title: "Email",
                      value: PortfolioData.email,
                      onTap: () => _launch("mailto:${PortfolioData.email}"),
                      onCopy: () {
                        Clipboard.setData(
                          const ClipboardData(text: PortfolioData.email),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email copied to clipboard!"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildContactCard(
                      context,
                      icon: Icons.phone_rounded,
                      title: "Phone",
                      value: PortfolioData.phone,
                      onTap: () => _launch("tel:${PortfolioData.phone}"),
                      onCopy: () {
                        Clipboard.setData(
                          const ClipboardData(text: PortfolioData.phone),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Phone number copied to clipboard!"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildContactCard(
                      context,
                      icon: Icons.location_on_rounded,
                      title: "Location",
                      value: PortfolioData.location,
                      onTap: null,
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(
                          child: _buildContactCard(
                            context,
                            icon: Icons.email_rounded,
                            title: "Email",
                            value: PortfolioData.email,
                            onTap: () => _launch("mailto:${PortfolioData.email}"),
                            onCopy: () {
                              Clipboard.setData(
                                const ClipboardData(text: PortfolioData.email),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Email copied to clipboard!"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildContactCard(
                            context,
                            icon: Icons.phone_rounded,
                            title: "Phone",
                            value: PortfolioData.phone,
                            onTap: () => _launch("tel:${PortfolioData.phone}"),
                            onCopy: () {
                              Clipboard.setData(
                                const ClipboardData(text: PortfolioData.phone),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Phone number copied to clipboard!"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildContactCard(
                            context,
                            icon: Icons.location_on_rounded,
                            title: "Location",
                            value: PortfolioData.location,
                            onTap: null,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 32),

                  // Social / Professional Links Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDark
                            ? [
                                const Color(0xFF1E293B),
                                const Color(0xFF0F172A),
                              ]
                            : [
                                Colors.white,
                                const Color(0xFFF1F5F9),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: primaryColor.withOpacity(0.25),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Let's Connect & Collaborate",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Find me on professional platforms or send a direct message.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _launch(PortfolioData.linkedin),
                              icon: const Icon(Icons.link_rounded),
                              label: const Text("LinkedIn"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => _launch(PortfolioData.github),
                              icon: const Icon(Icons.code_rounded),
                              label: const Text("GitHub"),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
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
                            FilledButton.tonalIcon(
                              onPressed: () =>
                                  _launch("mailto:${PortfolioData.email}"),
                              icon: const Icon(Icons.send_rounded),
                              label: const Text("Send Mail"),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
    VoidCallback? onCopy,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: primaryColor, size: 24),
              ),
              if (onCopy != null)
                IconButton(
                  icon: const Icon(Icons.copy_rounded, size: 18),
                  tooltip: "Copy $title",
                  onPressed: onCopy,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: onTap != null
                          ? primaryColor
                          : Theme.of(context).textTheme.bodyLarge?.color,
                      decoration:
                          onTap != null ? TextDecoration.underline : null,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
