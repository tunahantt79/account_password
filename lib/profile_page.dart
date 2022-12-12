import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Giriş yapılan e-mail'),
          SizedBox(
            height: 8,
          ),
          Text(
            user.email!,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(
              Icons.arrow_back,
              size: 32,
            ),
            label: Text(
              'Çıkış',
              style: TextStyle(fontSize: 24),
            ),
          )
        ]),
      ),
    );
  }
}
