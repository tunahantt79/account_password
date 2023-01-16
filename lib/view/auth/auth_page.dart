import 'package:flutter/material.dart';
import 'package:kullanici_sifre/view/auth/signup_page.dart';

import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginPage(
            onClickedSignUp: toggle,
          )
        : SignUpPage(onClickedSignIn: toggle);
  }

  void toggle() => setState(() => isLogin = !isLogin);
}

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   //giriş yap fonksiyonu
//   Future<User?> signIn(String email, String password) async {
//     var user = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//     return user.user;
//   }

//   //çıkış yap fonksiyonu
//   signOut() async {
//     return await _auth.signOut();
//   }

//   //kayıt ol fonksiyonu
//   Future<User?> createPerson(String name, String email, String password) async {
//     var user = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);

//     await _firestore
//         .collection("Person")
//         .doc(user.user!.uid)
//         .set({'userName': name, 'email': email});
//     return user.user;
//   }
// }
