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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          FlutterLogo(
            size: 120,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Merhaba,\n Tekrar Hoşgeldin',
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Şifre'),
            obscureText: true,
          ),
          ElevatedButton.icon(
              onPressed: signUp,
              icon: Icon(Icons.arrow_forward),
              label: Text('Kayıt Ol')),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.white),
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
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
