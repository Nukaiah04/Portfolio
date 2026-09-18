import 'package:flutter/material.dart';

class SkillChip extends StatefulWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  (IconData, Color) _getSkillIconAndColor(String skill) {
    final lower = skill.toLowerCase();

    if (lower.contains('docker')) {
      return (Icons.layers_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('kubernetes') || lower.contains('gke')) {
      return (Icons.hub_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('terraform')) {
      return (Icons.architecture_rounded, const Color(0xFFA855F7));
    }
    if (lower.contains('google cloud') || lower.contains('gcp')) {
      return (Icons.cloud_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('cloud build') ||
        lower.contains('actions') ||
        lower.contains('jenkins') ||
        lower.contains('ci/cd')) {
      return (Icons.sync_alt_rounded, const Color(0xFF34D399));
    }
    if (lower.contains('cloud run') || lower.contains('compute engine')) {
      return (Icons.dns_rounded, const Color(0xFF60A5FA));
    }
    if (lower.contains('artifact') || lower.contains('secret manager')) {
      return (Icons.lock_rounded, const Color(0xFFFBBF24));
    }
    if (lower.contains('iam')) {
      return (Icons.shield_rounded, const Color(0xFF818CF8));
    }
    if (lower.contains('security') ||
        lower.contains('firewall') ||
        lower.contains('trivy')) {
      return (Icons.shield_rounded, const Color(0xFFF87171));
    }
    if (lower.contains('sonarqube')) {
      return (Icons.verified_user_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('prometheus') || lower.contains('grafana') || lower.contains('alertmanager') || lower.contains('monitoring') || lower.contains('logging')) {
      return (Icons.insights_rounded, const Color(0xFFFB923C));
    }
    if (lower.contains('git')) {
      return (Icons.code_rounded, const Color(0xFFE2E8F0));
    }
    if (lower.contains('linux') || lower.contains('ubuntu') || lower.contains('bash') || lower.contains('systemd')) {
      return (Icons.terminal_rounded, const Color(0xFFFACC15));
    }
    if (lower.contains('helm')) {
      return (Icons.sailing_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('nginx')) {
      return (Icons.swap_horiz_rounded, const Color(0xFF4ADE80));
    }
    if (lower.contains('postgres') || lower.contains('redis')) {
      return (Icons.storage_rounded, const Color(0xFF60A5FA));
    }
    if (lower.contains('network') || lower.contains('vpc') || lower.contains('subnet') || lower.contains('cidr') || lower.contains('routing') || lower.contains('nat') || lower.contains('load balanc')) {
      return (Icons.lan_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('tcp') || lower.contains('dns') || lower.contains('http') || lower.contains('ssh') || lower.contains('ssl') || lower.contains('protocol') || lower.contains('port')) {
      return (Icons.wifi_tethering_rounded, const Color(0xFF818CF8));
    }
    if (lower.contains('python')) {
      return (Icons.code_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('yaml')) {
      return (Icons.data_object_rounded, const Color(0xFFA855F7));
    }
    if (lower.contains('vault') || lower.contains('secret')) {
      return (Icons.lock_rounded, const Color(0xFFFBBF24));
    }
    if (lower.contains('load balanc')) {
      return (Icons.balance_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('dns')) {
      return (Icons.dns_rounded, const Color(0xFF818CF8));
    }
    if (lower.contains('ssl') || lower.contains('tls') || lower.contains('cert')) {
      return (Icons.verified_rounded, const Color(0xFF10B981));
    }
    if (lower.contains('vs code')) {
      return (Icons.laptop_chromebook_rounded, const Color(0xFF38BDF8));
    }
    if (lower.contains('postman')) {
      return (Icons.send_rounded, const Color(0xFFFB923C));
    }

    return (Icons.verified_outlined, const Color(0xFF38BDF8));
  }

  @override
  Widget build(BuildContext context) {
    final (iconData, iconColor) = _getSkillIconAndColor(widget.label);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Base colors
    final baseBorderColor = isDark
        ? const Color(0xFF1E40AF).withOpacity(0.85) // #1e40af as requested
        : const Color(0xFF93C5FD);
    final hoverBorderColor = const Color(0xFF22D3EE); // hover:border-cyan-400
    final baseBgColor = isDark
        ? const Color(0xFF0F172A).withOpacity(0.65)
        : const Color(0xFFF0F9FF);
    final hoverBgColor = isDark
        ? const Color(0xFF0891B2).withOpacity(0.22)
        : const Color(0xFFE0F2FE);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? (Matrix4.identity()..translate(0.0, -2.5))
            : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered ? hoverBgColor : baseBgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isHovered ? hoverBorderColor : baseBorderColor,
            width: _isHovered ? 1.5 : 1.1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF06B6D4).withOpacity(0.35), // hover:shadow-cyan-500/20
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.2 : 0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 15,
              color: _isHovered ? hoverBorderColor : iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: TextStyle(
                color: _isHovered
                    ? (isDark ? Colors.white : const Color(0xFF0C4A6E))
                    : (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B)),
                fontSize: 13.5,
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
