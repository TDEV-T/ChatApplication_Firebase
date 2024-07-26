import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCre = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //if user doesn't already exist
      _fireStore
          .collection("Users")
          .doc(userCre.user!.uid)
          .set({'uid': userCre.user!.uid, 'email': email});
      return userCre;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
  //sign up

  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential _uCre = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //save user on firestore
      _fireStore
          .collection("Users")
          .doc(_uCre.user!.uid)
          .set({'uid': _uCre.user!.uid, 'email': email});
      return _uCre;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return _auth.signOut();
  }
}
