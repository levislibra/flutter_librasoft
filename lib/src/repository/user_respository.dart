// Imports
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class UserRepository {
    final FirebaseAuth _firebaseAuth;
    final GoogleSignIn _googleSignIn;

  //Contructors
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn}):
  _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  _googleSignIn = googleSignIn ?? GoogleSignIn();
  
  // SignInwhitGoogle
  Future<FirebaseUser> singInWhitGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );

    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();

  }
  // SignInWhitCredentials
  Future<void> signInWithCredential(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // SignUp - Registro
  Future<void> signUp(String email, String password) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: null,
      password: null,
    );
  }
  // SignOut
  Future<void> signOut() async{
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
  // Esta logueado
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }
  // Obtener usuario
  Future<String> getUser() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser.email;
  }
}