import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/theme.dart';
import '../../models/job_model.dart';
import '../../widgets/job_card.dart';
import 'job_detail_screen.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  String _selectedCategory = 'All';
  final _jobs = JobModel.mock();

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedCategory == 'All'
        ? _jobs
        : _jobs.where((j) => j.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LANDER Work', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.tune), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Post a Job'),
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_search, size: 18),
                    label: const Text('Find Talent'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: ['All', ...AppConstants.workCategories].map((cat) {
                final selected = cat == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: selected,
                    onSelected: (_) => setState(() => _selectedCategory = cat),
                    selectedColor: AppColors.primaryOrange,
                    labelStyle: TextStyle(
                      color: selected ? AppColors.white : AppColors.darkGray,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => JobCard(
                job: filtered[i],
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => JobDetailScreen(job: filtered[i])),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
