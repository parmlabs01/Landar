import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/post_model.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primaryOrange.withOpacity(0.15),
                  child: Text(
                    post.authorName[0],
                    style: const TextStyle(color: AppColors.primaryOrange, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.authorName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                      Text('${post.authorRole} · ${post.postedAgo}',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.grey),
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(post.content, style: const TextStyle(fontSize: 14, height: 1.45)),
            if (post.format == PostFormat.image) ...[
              const SizedBox(height: 12),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.image_outlined, color: Colors.grey.shade400, size: 40),
              ),
            ],
            if (post.format == PostFormat.poll) ...[
              const SizedBox(height: 12),
              _pollOption('Late/delayed client payments', 0.46),
              const SizedBox(height: 8),
              _pollOption('Currency conversion fees', 0.28),
              const SizedBox(height: 8),
              _pollOption('Lack of escrow protection', 0.26),
            ],
            if (post.tags.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                children: post.tags
                    .map((t) => Text(t, style: const TextStyle(color: AppColors.primaryOrange, fontSize: 12.5, fontWeight: FontWeight.w600)))
                    .toList(),
              ),
            ],
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _actionButton(Icons.favorite_border, '${post.likes}'),
                _actionButton(Icons.chat_bubble_outline, '${post.comments}'),
                _actionButton(Icons.share_outlined, '${post.shares}'),
                _actionButton(Icons.bookmark_border, 'Save'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pollOption(String label, double fraction) {
    return Stack(
      children: [
        Container(
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        FractionallySizedBox(
          widthFactor: fraction,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withOpacity(0.25),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(child: Text(label, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500))),
                Text('${(fraction * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600)),
      ],
    );
  }
}
