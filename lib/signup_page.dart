import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const FlutterLogo(
            size: 120,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Merhaba,\n Tekrar Hoşgeldin',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(
            height: 4,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Şifre'),
            obscureText: true,
          ),
          ElevatedButton.icon(
              onPressed: signUp,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Kayıt Ol')),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  text: 'Hesabın var mı?  ',
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                    text: 'Giriş Yap',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary))
              ]))
        ],
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    //  await _firestore.collection('users').doc(email.user).set('name') ;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
