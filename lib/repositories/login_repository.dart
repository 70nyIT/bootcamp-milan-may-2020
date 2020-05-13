import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<FirebaseUser> getCurrentUser();
  Future<FirebaseUser> register(String email, String password);
  Future<FirebaseUser> signIn(String email, String password);
  Future<void> signOut();
}

class LoginRepositoryImpl extends LoginRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> signIn(String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

  @override
  Future<FirebaseUser> register(String email, String password) async {
    return (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
  }
}
