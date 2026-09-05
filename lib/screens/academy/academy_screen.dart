import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/theme.dart';
import '../../models/course_model.dart';
import '../../widgets/course_card.dart';
import 'course_detail_screen.dart';

class AcademyScreen extends StatefulWidget {
  const AcademyScreen({super.key});

  @override
  State<AcademyScreen> createState() => _AcademyScreenState();
}

class _AcademyScreenState extends State<AcademyScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _courses = CourseModel.mock();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final myLearning = _courses.where((c) => c.progress > 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parm Academy', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryOrange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primaryOrange,
          tabs: const [Tab(text: 'Explore'), Tab(text: 'My Learning')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _exploreTab(),
          _myLearningTab(myLearning),
        ],
      ),
    );
  }

  Widget _exploreTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: AppConstants.academyCategories.map((cat) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(label: Text(cat)),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Popular Courses', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        const SizedBox(height: 12),
        ..._courses.map((c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CourseCard(
                course: c,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CourseDetailScreen(course: c)),
                ),
              ),
            )),
      ],
    );
  }

  Widget _myLearningTab(List<CourseModel> courses) {
    if (courses.isEmpty) {
      return Center(
        child: Text('No courses in progress yet.', style: TextStyle(color: Colors.grey.shade500)),
      );
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.emoji_events, color: AppColors.primaryOrange, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('2 Certificates earned', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    Text('Keep learning to unlock more badges', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...courses.map((c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CourseCard(
                course: c,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CourseDetailScreen(course: c)),
                ),
              ),
            )),
      ],
    );
  }
}
