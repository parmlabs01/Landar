enum PostFormat { text, image, poll }

class PostModel {
  final String id;
  final String authorName;
  final String authorRole;
  final String content;
  final String postedAgo;
  final PostFormat format;
  final int likes;
  final int comments;
  final int shares;
  final List<String> tags;

  const PostModel({
    required this.id,
    required this.authorName,
    required this.authorRole,
    required this.content,
    required this.postedAgo,
    required this.format,
    required this.likes,
    required this.comments,
    required this.shares,
    this.tags = const [],
  });

  static List<PostModel> mock() => [
        const PostModel(
          id: 'p1',
          authorName: 'Chidi Umeh',
          authorRole: 'Full Stack Developer',
          content:
              'Just shipped a new open-source Flutter package for offline-first data sync. Would love feedback from the community!',
          postedAgo: '1h',
          format: PostFormat.text,
          likes: 128,
          comments: 24,
          shares: 9,
          tags: ['#Flutter', '#OpenSource'],
        ),
        const PostModel(
          id: 'p2',
          authorName: 'Nneka Obi',
          authorRole: 'AI Researcher',
          content:
              'Breaking: New on-device LLM benchmark shows a 3x speed improvement for mobile inference. Full write-up in comments.',
          postedAgo: '3h',
          format: PostFormat.image,
          likes: 342,
          comments: 58,
          shares: 41,
          tags: ['#AI', '#TechNews'],
        ),
        const PostModel(
          id: 'p3',
          authorName: 'Femi Okoro',
          authorRole: 'Startup Founder',
          content:
              'Poll: What\'s the biggest blocker for freelancers in Africa getting paid on time?',
          postedAgo: '6h',
          format: PostFormat.poll,
          likes: 89,
          comments: 63,
          shares: 5,
          tags: ['#Freelancing'],
        ),
        const PostModel(
          id: 'p4',
          authorName: 'Amara Nwosu',
          authorRole: 'Cybersecurity Analyst',
          content:
              'Cybersecurity alert: a new phishing campaign is targeting freelance developers via fake job offers. Stay vigilant and verify clients.',
          postedAgo: '1d',
          format: PostFormat.text,
          likes: 210,
          comments: 32,
          shares: 77,
          tags: ['#CyberAlert'],
        ),
      ];
}
