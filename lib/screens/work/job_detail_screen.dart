import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../models/job_model.dart';

class JobDetailScreen extends StatelessWidget {
  final JobModel job;
  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(job.clientName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                if (job.isVerifiedClient) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.verified, size: 15, color: AppColors.primaryOrange),
                ],
                const SizedBox(width: 8),
                Text('· ${job.postedAgo}', style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statColumn('Budget', job.budget),
                  _divider(),
                  _statColumn('Type', job.budgetType),
                  _divider(),
                  _statColumn('Proposals', '${job.proposals}'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Description', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 8),
            Text(job.description, style: const TextStyle(fontSize: 14.5, height: 1.5)),
            const SizedBox(height: 24),
            const Text('Skills Required', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: job.skills.map((s) => Chip(label: Text(s))).toList(),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Proposal submitted!')),
                  );
                },
                child: const Text('Submit Proposal'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statColumn(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: AppColors.primaryOrange)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _divider() => Container(width: 1, height: 32, color: Colors.grey.shade300);
}
