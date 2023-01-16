import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kullanici_sifre/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:kullanici_sifre/view/auth/utils.dart';

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
  final formKey = GlobalKey<FormState>();
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
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
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
            TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Email giriniz'
                        : null),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return 'En az 6 karakter giriniz';
                  } else {
                    return null;
                  }
                }),
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
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      //  await _firestore.collection('users').doc(email.user).set('name') ;
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    //Navigator.of(context) not working !
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
