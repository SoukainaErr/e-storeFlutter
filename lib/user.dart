import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fireStoreInstance = Firestore.instance;

  Future<FirebaseUser> handleSignInEmail(String email, String password) async {
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');
    if (user == null) print("login unsuccessful");

    return user;
  }

  Future<FirebaseUser> handleSignUp(email, password) async {
    AuthResult result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
