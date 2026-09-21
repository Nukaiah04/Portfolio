import 'package:flutter/material.dart';
import '../sections/hero_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/education_section.dart';
import '../sections/contact_section.dart';
import '../data/portfolio_data.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Map<String, GlobalKey> get _navSections => {
    'Home': _heroKey,
    'Skills': _skillsKey,
    'Experience': _experienceKey,
    'Projects': _projectsKey,
    'Education': _educationKey,
    'Contact': _contactKey,
  };

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 850;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor.withOpacity(0.95),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: isMobile
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu_rounded, size: 28),
                  tooltip: "Open Menu",
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : null,
        title: InkWell(
          onTap: () => _scrollToSection(_heroKey),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "YN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                if (!isMobile) ...[
                  const SizedBox(width: 10),
                  Text(
                    PortfolioData.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
          // Desktop Navigation Links
          if (!isMobile)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: _navSections.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextButton(
                    onPressed: () => _scrollToSection(entry.value),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

          const SizedBox(width: 8),

          // Theme Toggle Button
          IconButton(
            icon: Icon(
              widget.isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              color: primaryColor,
            ),
            tooltip: widget.isDarkMode
                ? "Switch to Light Theme"
                : "Switch to Dark Theme",
            onPressed: widget.onThemeToggle,
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: isMobile
          ? Drawer(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  PortfolioData.name,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  PortfolioData.title,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.close_rounded),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          children: _navSections.entries.map((entry) {
                            return ListTile(
                              leading: Icon(
                                _getSectionIcon(entry.key),
                                color: primaryColor,
                              ),
                              title: Text(
                                entry.key,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onTap: () {
                                Navigator.pop(context); // close drawer
                                _scrollToSection(entry.value);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              widget.isDarkMode ? "Dark Mode" : "Light Mode",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            IconButton.filledTonal(
                              icon: Icon(
                                widget.isDarkMode
                                    ? Icons.light_mode_rounded
                                    : Icons.dark_mode_rounded,
                              ),
                              onPressed: widget.onThemeToggle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      key: _heroKey,
                      child: HeroSection(
                        onContactTap: () => _scrollToSection(_contactKey),
                      ),
                    ),
                    SizedBox(key: _skillsKey, child: const SkillsSection()),
                    SizedBox(key: _experienceKey, child: const ExperienceSection()),
                    SizedBox(key: _projectsKey, child: const ProjectsSection()),
                    SizedBox(key: _educationKey, child: const EducationSection()),
                    SizedBox(key: _contactKey, child: const ContactSection()),
                    const SizedBox(height: 60),

                    // Footer
                    Divider(
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Text(
                          "© ${DateTime.now().year} ${PortfolioData.name} · Built with Flutter Web ♥",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getSectionIcon(String title) {
    switch (title) {
      case 'Home':
        return Icons.home_rounded;
      case 'Skills':
        return Icons.code_rounded;
      case 'Experience':
        return Icons.work_history_rounded;
      case 'Projects':
        return Icons.rocket_launch_rounded;
      case 'Education':
        return Icons.school_rounded;
      case 'Contact':
        return Icons.contacts_rounded;
      default:
        return Icons.circle;
    }
  }
}
