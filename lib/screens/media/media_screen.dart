import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../models/post_model.dart';
import '../../widgets/post_card.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = PostModel.mock();
    final trending = ['#Flutter', '#AI', '#Freelancing', '#Cybersecurity', '#Startups'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LANDER Media', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: trending
                  .map((t) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(t),
                          backgroundColor: AppColors.primaryOrange.withOpacity(0.1),
                          labelStyle: const TextStyle(color: AppColors.primaryOrange, fontWeight: FontWeight.w600),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
          ...posts.map((p) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: PostCard(post: p),
              )),
        ],
      ),
    );
  }
}
