class Team {
  final String teamName;
  final List<String> teamMembers;

  Team({required this.teamName, required this.teamMembers});

  factory Team.fromFirestore(Map<String, dynamic> data) {
    return Team(
      teamName: data['team_name'] ?? '',
      teamMembers: List<String>.from(data['team_members'] ?? []),
    );
  }
}
