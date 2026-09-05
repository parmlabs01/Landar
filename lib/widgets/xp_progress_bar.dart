import 'package:flutter/material.dart';
import '../core/theme.dart';

class XpProgressBar extends StatelessWidget {
  final int xp;
  final int xpToNextLevel;
  final String level;

  const XpProgressBar({
    super.key,
    required this.xp,
    required this.xpToNextLevel,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final fraction = (xp / xpToNextLevel).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.bolt, color: AppColors.primaryOrange, size: 18),
                const SizedBox(width: 4),
                Text('Level: $level', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
              ],
            ),
            Text('$xp / $xpToNextLevel XP', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 8,
            backgroundColor: AppColors.lightGray,
            valueColor: const AlwaysStoppedAnimation(AppColors.primaryOrange),
          ),
        ),
      ],
    );
  }
}
