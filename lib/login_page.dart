import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 38, 65, 104),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.75),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(labelText: 'Şifre'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: signIn,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      icon: Icon(Icons.lock_open, size: 32),
                      label: Text('Giriş Yap'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      child: Text(
                        'Şifremi Unuttum',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            text: 'Hesabın mı yok ?  ',
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignUp,
                              text: 'Kayıt Ol',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color:
                                      Theme.of(context).colorScheme.secondary))
                        ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
