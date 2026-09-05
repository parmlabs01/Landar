class JobModel {
  final String id;
  final String title;
  final String clientName;
  final String category;
  final String budget;
  final String budgetType; // Fixed or Hourly
  final String description;
  final List<String> skills;
  final int proposals;
  final String postedAgo;
  final bool isVerifiedClient;

  const JobModel({
    required this.id,
    required this.title,
    required this.clientName,
    required this.category,
    required this.budget,
    required this.budgetType,
    required this.description,
    required this.skills,
    required this.proposals,
    required this.postedAgo,
    this.isVerifiedClient = false,
  });

  static List<JobModel> mock() => [
        const JobModel(
          id: 'job1',
          title: 'Flutter Developer for Fintech Mobile App',
          clientName: 'Zenith Capital',
          category: 'Mobile Development',
          budget: '\$1,200',
          budgetType: 'Fixed',
          description:
              'We need an experienced Flutter developer to build a savings and investment app with biometric auth and a wallet dashboard.',
          skills: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
          proposals: 14,
          postedAgo: '2h ago',
          isVerifiedClient: true,
        ),
        const JobModel(
          id: 'job2',
          title: 'UI/UX Designer for E-Commerce Redesign',
          clientName: 'Marketly',
          category: 'UI/UX Design',
          budget: '\$35/hr',
          budgetType: 'Hourly',
          description:
              'Redesign our checkout flow and product pages to improve conversion. Figma required.',
          skills: ['Figma', 'UX Research', 'Prototyping'],
          proposals: 9,
          postedAgo: '5h ago',
        ),
        const JobModel(
          id: 'job3',
          title: 'Cybersecurity Audit for SaaS Platform',
          clientName: 'CloudNest',
          category: 'Cybersecurity',
          budget: '\$800',
          budgetType: 'Fixed',
          description:
              'Perform a security audit including penetration testing and a vulnerability report.',
          skills: ['Penetration Testing', 'OWASP', 'Network Security'],
          proposals: 6,
          postedAgo: '1d ago',
          isVerifiedClient: true,
        ),
        const JobModel(
          id: 'job4',
          title: 'AI Prompt Engineer for Chatbot Project',
          clientName: 'Nova Labs',
          category: 'AI & Machine Learning',
          budget: '\$25/hr',
          budgetType: 'Hourly',
          description:
              'Design and refine prompts for a customer support chatbot built on an LLM API.',
          skills: ['Prompt Engineering', 'Python', 'LLMs'],
          proposals: 21,
          postedAgo: '3d ago',
        ),
      ];
}
