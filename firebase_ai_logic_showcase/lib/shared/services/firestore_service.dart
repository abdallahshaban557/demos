import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/team.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'ai-logic',
  );

  Future<List<Team>> getTeams() async {
    try {
      final snapshot = await _db.collection('teams').get();
      return snapshot.docs
          .map((doc) => Team.fromFirestore(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting teams: $e');
      return [];
    }
  }
}
