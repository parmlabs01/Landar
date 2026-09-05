import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/job_model.dart';

class JobCard extends StatelessWidget {
  final JobModel job;
  final VoidCallback? onTap;

  const JobCard({super.key, required this.job, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      job.title,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15.5),
                    ),
                  ),
                  Text(job.postedAgo,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(job.clientName,
                      style: const TextStyle(fontSize: 13, color: AppColors.darkGray, fontWeight: FontWeight.w500)),
                  if (job.isVerifiedClient) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.verified, size: 14, color: AppColors.primaryOrange),
                  ],
                ],
              ),
              const SizedBox(height: 10),
              Text(
                job.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.5, color: Colors.grey.shade700, height: 1.4),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: job.skills
                    .take(3)
                    .map((s) => Chip(
                          label: Text(s),
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    job.budget,
                    style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryOrange, fontSize: 15),
                  ),
                  Text(' · ${job.budgetType}', style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600)),
                  const Spacer(),
                  Icon(Icons.description_outlined, size: 14, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Text('${job.proposals} proposals', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
