import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kullanici_sifre/view/navigation_bar/message/service.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final _service = FirebaseNotificationService();
     @override
  void initState() {
    super.initState();
    _service.connectNotification();
  }
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
                    Expanded(
                        flex: 3, child: Image.network(ds['image'].toString())),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ds['name'].toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
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
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
