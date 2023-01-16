import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'image_add.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profil'),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  duration: const Duration(milliseconds: 100),
                  child: ListView(
                    children: [
                      const Center(child: Text('Giriş yapılan e-mail')),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Text(
                          user.email!,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 32,
                  ),
                  label: const Text(
                    'Çıkış',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
        body: buildBody());
  }
}

Widget buildBody() {
  final user = FirebaseAuth.instance.currentUser!;
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();

        return ListView(shrinkWrap: true, primary: false, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GoogleMLKitExample(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.mail,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Text(
                          user.email!,
                          style: const TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ],
          )
        ]);
      });
}
