import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback? onTap;

  const CourseCard({super.key, required this.course, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.play_circle_fill, color: AppColors.primaryOrange, size: 30),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5)),
                    const SizedBox(height: 4),
                    Text('by ${course.instructor}',
                        style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFB800), size: 14),
                        const SizedBox(width: 3),
                        Text('${course.rating}', style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
                        const SizedBox(width: 8),
                        Text('${course.studentsCount} students',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                      ],
                    ),
                    if (course.progress > 0) ...[
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: course.progress,
                          minHeight: 5,
                          backgroundColor: AppColors.lightGray,
                          valueColor: const AlwaysStoppedAnimation(AppColors.primaryOrange),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text('${(course.progress * 100).toInt()}% complete',
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                    ] else
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          course.price,
                          style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryOrange, fontSize: 13.5),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
