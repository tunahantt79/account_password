import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildBody(),
        ));
  }

  Widget buildBody() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LinearProgressIndicator();
          // gridview ile yap
          if (snapshot.hasError) debugPrint('errrorrr ${snapshot.error}');
          return GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data!.docs[index];
              return Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(ds['image'].toString()),
                    Text(
                      ds['name'].toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.of(
                        context,
                      ).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return InfoPage(
                          appbarTitle: ds['name'].toString(),
                          image: ds['image'].toString(),
                          info: ds['info'].toString(),
                        );
                      })),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      icon: const Icon(
                        Icons.info,
                      ),
                      label: const Text('Hakkinda'),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
