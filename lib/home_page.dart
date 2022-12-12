import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference arabalarRef = _firestore.collection('arabalar');

    var f1Ref = arabalarRef.doc('Bugatti').id;
    debugPrint('${arabalarRef.doc('Bugatti')}aaaaa');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${f1Ref}'),
        ),
        body: Scrollbar(
          controller: _controller,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
                stream: arabalarRef.snapshots(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {}
                  return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      controller: _controller,
                      itemCount: asyncSnapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot dokumanverisi =
                            asyncSnapshot.data!.docs[index];
                        return Card(
                          elevation: 40,
                          shadowColor: Colors.black,
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Image.asset(items[index]['image']),
                                Text(
                                  '${dokumanverisi['name']}',
                                  style: TextStyle(fontSize: 25),
                                ),
                                // ElevatedButton.icon(
                                //   onPressed: () => Navigator.of(
                                //     context,
                                //   ).push(CupertinoPageRoute(
                                //       builder: (BuildContext context) {
                                //     return items[index]['page'];
                                //   })),
                                //   style: ElevatedButton.styleFrom(
                                //     minimumSize: Size.fromHeight(50),
                                //   ),
                                //   icon: Icon(
                                //     Icons.info,
                                //   ),
                                //   label: Text('Hakkında'),
                                // ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ));
  }
}
