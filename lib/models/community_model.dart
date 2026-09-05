class CommunityModel {
  final String id;
  final String name;
  final String category;
  final int membersCount;
  final String description;
  final bool joined;

  const CommunityModel({
    required this.id,
    required this.name,
    required this.category,
    required this.membersCount,
    required this.description,
    this.joined = false,
  });

  static List<CommunityModel> mock() => [
        const CommunityModel(
          id: 'com1',
          name: 'Flutter Devs Africa',
          category: 'Developers',
          membersCount: 12400,
          description: 'A community for Flutter developers across Africa to share tips and jobs.',
          joined: true,
        ),
        const CommunityModel(
          id: 'com2',
          name: 'AI Builders Hub',
          category: 'AI Engineers',
          membersCount: 8700,
          description: 'Discuss AI tools, models, and real-world product builds.',
        ),
        const CommunityModel(
          id: 'com3',
          name: 'Design Circle',
          category: 'Designers',
          membersCount: 6300,
          description: 'UI/UX designers sharing critiques, resources, and freelance leads.',
        ),
        const CommunityModel(
          id: 'com4',
          name: 'Freelance Founders',
          category: 'Freelancers',
          membersCount: 15200,
          description: 'For freelancers scaling into agencies and small businesses.',
          joined: true,
        ),
        const CommunityModel(
          id: 'com5',
          name: 'Startup Founders Network',
          category: 'Startups',
          membersCount: 9100,
          description: 'Early-stage founders trading notes on fundraising and growth.',
        ),
      ];
}
