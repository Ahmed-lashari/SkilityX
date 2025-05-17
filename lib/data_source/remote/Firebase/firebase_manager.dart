import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  // auth
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final User? _user = _auth.currentUser;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // getters
  static FirebaseAuth get auth => _auth;
  static FirebaseFirestore get firestore => _firestore;
  static User? get user => _user;
}
