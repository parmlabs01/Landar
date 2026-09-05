class CourseModel {
  final String id;
  final String title;
  final String instructor;
  final String category;
  final double rating;
  final int studentsCount;
  final String price; // 'Free' or amount
  final int lessonsCount;
  final String level;
  final double progress; // 0.0 - 1.0, for "my learning"

  const CourseModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.category,
    required this.rating,
    required this.studentsCount,
    required this.price,
    required this.lessonsCount,
    required this.level,
    this.progress = 0,
  });

  static List<CourseModel> mock() => [
        const CourseModel(
          id: 'c1',
          title: 'Flutter & Dart: Build Production Apps',
          instructor: 'Ada Okafor',
          category: 'Development',
          rating: 4.8,
          studentsCount: 3200,
          price: '\$49',
          lessonsCount: 62,
          level: 'Intermediate',
          progress: 0.42,
        ),
        const CourseModel(
          id: 'c2',
          title: 'Prompt Engineering for Real-World AI Products',
          instructor: 'Kwame Mensah',
          category: 'AI',
          rating: 4.9,
          studentsCount: 5100,
          price: '\$39',
          lessonsCount: 34,
          level: 'Beginner',
          progress: 0.15,
        ),
        const CourseModel(
          id: 'c3',
          title: 'UI/UX Design Fundamentals with Figma',
          instructor: 'Zainab Bello',
          category: 'Design',
          rating: 4.7,
          studentsCount: 8900,
          price: 'Free',
          lessonsCount: 28,
          level: 'Beginner',
        ),
        const CourseModel(
          id: 'c4',
          title: 'Freelancing Mastery: From Zero to First Client',
          instructor: 'Tunde Adeyemi',
          category: 'Business',
          rating: 4.6,
          studentsCount: 4400,
          price: '\$29',
          lessonsCount: 20,
          level: 'Beginner',
        ),
        const CourseModel(
          id: 'c5',
          title: 'Ethical Hacking: Network Penetration Testing',
          instructor: 'Grace Mwangi',
          category: 'Cybersecurity',
          rating: 4.8,
          studentsCount: 2700,
          price: '\$59',
          lessonsCount: 45,
          level: 'Advanced',
        ),
      ];
}
