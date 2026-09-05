import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../models/course_model.dart';

class CourseDetailScreen extends StatelessWidget {
  final CourseModel course;
  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final enrolled = course.progress > 0;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: AppColors.darkGray,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.darkGray,
                child: const Center(
                  child: Icon(Icons.play_circle_fill, color: AppColors.primaryOrange, size: 56),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(label: Text(course.category)),
                  const SizedBox(height: 10),
                  Text(course.title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text('by ${course.instructor} · ${course.level}',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13.5)),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFB800), size: 16),
                      const SizedBox(width: 4),
                      Text('${course.rating}', style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(width: 12),
                      Text('${course.studentsCount} students', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                      const SizedBox(width: 12),
                      Text('${course.lessonsCount} lessons', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                    ],
                  ),
                  if (enrolled) ...[
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: course.progress,
                        minHeight: 8,
                        backgroundColor: AppColors.lightGray,
                        valueColor: const AlwaysStoppedAnimation(AppColors.primaryOrange),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text('${(course.progress * 100).toInt()}% complete',
                        style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600)),
                  ],
                  const SizedBox(height: 24),
                  const Text('What you\'ll learn', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 10),
                  ...[
                    'Hands-on projects with real-world scenarios',
                    'Best practices used by working professionals',
                    'A completion certificate and skill badge',
                  ].map((t) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle, color: AppColors.primaryOrange, size: 18),
                            const SizedBox(width: 8),
                            Expanded(child: Text(t, style: const TextStyle(fontSize: 14))),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                  const Text('Curriculum', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 10),
                  ...List.generate(4, (i) => _lessonTile('Module ${i + 1}', '${5 + i} lessons', i == 0 && enrolled)),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(enrolled ? 'Continue Learning' : 'Enroll · ${course.price}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lessonTile(String title, String subtitle, bool active) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: active ? AppColors.primaryOrange.withOpacity(0.08) : AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(active ? Icons.play_circle_fill : Icons.lock_outline,
              color: active ? AppColors.primaryOrange : Colors.grey.shade500, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
