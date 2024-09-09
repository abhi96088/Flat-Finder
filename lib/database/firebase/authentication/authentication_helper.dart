import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up a new user and store their details
  Future<User?> signUp(String name, String email, String password, String accountType, String gender) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    // Store additional user details in Firestore
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'email': email,
        'accountType': accountType,
        'gender': gender,
        'createdAt': DateTime.now(),
      });
    }

    return user;
  }

  // Log in an existing user
  Future<User?> login(String email, String password) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  // Log out the current user
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
