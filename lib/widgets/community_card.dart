import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/community_model.dart';

class CommunityCard extends StatelessWidget {
  final CommunityModel community;

  const CommunityCard({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.darkGray,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  community.name.substring(0, 1),
                  style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(community.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5)),
                  const SizedBox(height: 3),
                  Text('${community.category} · ${community.membersCount} members',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  const SizedBox(height: 4),
                  Text(community.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 34,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  side: BorderSide(color: community.joined ? Colors.grey.shade300 : AppColors.primaryOrange),
                  foregroundColor: community.joined ? Colors.grey.shade600 : AppColors.primaryOrange,
                ),
                child: Text(community.joined ? 'Joined' : 'Join', style: const TextStyle(fontSize: 12.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
