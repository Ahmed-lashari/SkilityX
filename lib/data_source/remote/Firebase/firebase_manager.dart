import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseManager {
  // auth
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final User? _user = _auth.currentUser;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseMessaging _cloudMessaging = FirebaseMessaging.instance;

  // getters
  static FirebaseAuth get auth => _auth;
  static User? get user => _user;
  static FirebaseFirestore get firestore => _firestore;
  static FirebaseMessaging get cloudMessaging => _cloudMessaging;
}
