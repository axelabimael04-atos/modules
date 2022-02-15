import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAndPasswordAuthProcess {

  Future<AuthenticatedUser> signIn({required String email, required String password}) async {

    UserCredential firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    String userToken = await firebaseUser.user!.getIdToken();

    return AuthenticatedUser(
      uid: firebaseUser.user!.uid, 
      token: userToken, 
    );
  }

  Future<AuthenticatedUser> signUp({required String email, required String password}) async {

    UserCredential firebaseUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    String userToken = await firebaseUser.user!.getIdToken();

    return AuthenticatedUser(
      uid: firebaseUser.user!.uid, 
      token: userToken, 
    );
  }
}