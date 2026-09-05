import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../models/user_model.dart';
import '../../widgets/xp_progress_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel.mock();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.primaryOrange.withOpacity(0.15),
                child: Text(user.name[0],
                    style: const TextStyle(color: AppColors.primaryOrange, fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 2),
                    Text(user.headline, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                    const SizedBox(height: 4),
                    Text(user.role, style: const TextStyle(fontSize: 12.5, color: AppColors.primaryOrange, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          OutlinedButton(onPressed: () {}, child: const Text('Edit Profile')),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.lightGray, borderRadius: BorderRadius.circular(14)),
            child: XpProgressBar(xp: user.xp, xpToNextLevel: user.xpToNextLevel, level: user.level),
          ),
          const SizedBox(height: 20),
          const Text('Badges', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: user.badges
                .map((b) => Chip(
                      avatar: const Icon(Icons.emoji_events, size: 16, color: AppColors.primaryOrange),
                      label: Text(b),
                    ))
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 10),
          _menuTile(Icons.work_outline, 'My Proposals & Contracts'),
          _menuTile(Icons.school_outlined, 'My Courses & Certificates'),
          _menuTile(Icons.article_outlined, 'My Posts'),
          _menuTile(Icons.account_balance_wallet_outlined, 'Earnings & Payments'),
          _menuTile(Icons.chat_bubble_outline, 'Messages'),
          _menuTile(Icons.logout, 'Log Out', isDestructive: true),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, String title, {bool isDestructive = false}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: isDestructive ? AppColors.danger : AppColors.darkGray),
      title: Text(title,
          style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600, color: isDestructive ? AppColors.danger : AppColors.darkGray)),
      trailing: isDestructive ? null : const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}
