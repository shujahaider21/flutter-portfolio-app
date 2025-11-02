class UserProfile {
  final String name;
  final String profession;
  final String bio;
  final String email;
  final String phone;
  final String location;
  final List<String> skills;
  final List<String> education;
  final List<String> hobbies;

  const UserProfile({
    required this.name,
    required this.profession,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.skills,
    required this.education,
    required this.hobbies,
  });
}

const demoUser = UserProfile(
  name: 'Shuja Haider',
  profession: 'Flutter Developer',
  bio:
      'Building clean, modern UIs with Flutter. Focused on performance and subtle animation.',
  email: 'mohammadshujahaidar@gmail.com',
  phone: '+92-310-5769769',
  location: 'Gilgit, Pakistan',
  skills: ['Flutter', 'Dart', 'Firebase', 'Web Development'],
  education: ['BS Computer Science — Karakoram International University'],
  hobbies: ['Photography', 'Gaming', 'Traveling'],
);
