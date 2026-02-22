/// Defines the three AI companion personas.
enum CompanionType { brian, gina, molly }

class Companion {
  final CompanionType type;
  final String name;
  final String role;
  final String description;
  final String greeting;

  const Companion({
    required this.type,
    required this.name,
    required this.role,
    required this.description,
    required this.greeting,
  });

  static const brian = Companion(
    type: CompanionType.brian,
    name: 'Brian',
    role: 'Your Companion',
    description: 'Warm, patient, and genuinely caring — like a thoughtful old friend who remembers everything.',
    greeting: 'Hey! Good to hear from you. What\'s on your mind?',
  );

  static const gina = Companion(
    type: CompanionType.gina,
    name: 'Gina',
    role: 'Fun & Activities',
    description: 'Upbeat, playful, and encouraging — like a fun neighbor who drops by for games.',
    greeting: 'Hey there! Ready to have some fun? What do you feel like doing today?',
  );

  static const molly = Companion(
    type: CompanionType.molly,
    name: 'Molly',
    role: 'News & Updates',
    description: 'Calm, articulate, and well-informed — like a trusted morning news anchor.',
    greeting: 'Good to see you! Want to catch up on what\'s happening in the world?',
  );

  static const all = [brian, gina, molly];

  static Companion fromType(CompanionType type) {
    switch (type) {
      case CompanionType.brian:
        return brian;
      case CompanionType.gina:
        return gina;
      case CompanionType.molly:
        return molly;
    }
  }
}
