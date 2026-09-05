class UserModel {
  final String name;
  final String role; // Student, Freelancer, Client, Instructor, Media Creator
  final String headline;
  final int xp;
  final int xpToNextLevel;
  final String level;
  final List<String> badges;

  const UserModel({
    required this.name,
    required this.role,
    required this.headline,
    required this.xp,
    required this.xpToNextLevel,
    required this.level,
    required this.badges,
  });

  static UserModel mock() => const UserModel(
        name: 'Tomiwa Adisa',
        role: 'Freelancer · Student',
        headline: 'Mobile Developer | Flutter & Firebase',
        xp: 640,
        xpToNextLevel: 1000,
        level: 'Contributor',
        badges: ['Top Freelancer', 'Verified Expert'],
      );
}
