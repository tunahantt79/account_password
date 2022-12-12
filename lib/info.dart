import 'package:flutter/material.dart';

List<Map<String, dynamic>> items = [
  {'id': 1, 'name': 'F1', 'image': 'assets/images/f1.jpg', 'page': F1()},
  {
    'id': 2,
    'name': 'Bugatti',
    'image': 'assets/images/bugatti.jpg',
    'page': F1()
  },
  {
    'id': 3,
    'name': 'Dodge-Challenger',
    'image': 'assets/images/challenger.jpg',
    'page': Challenger()
  },
  {
    'id': 4,
    'name': 'Dodge-Charger',
    'image': 'assets/images/charger.png',
    'page': F1()
  },
  {
    'id': 5,
    'name': 'Ferrari',
    'image': 'assets/images/ferrari.jpg',
    'page': F1()
  },
  {'id': 6, 'name': 'Mercedes', 'image': 'assets/images/g63.jpg', 'page': F1()},
  {
    'id': 7,
    'name': 'Jaguar',
    'image': 'assets/images/jaguar.jpg',
    'page': F1()
  },
  {'id': 8, 'name': 'Nissan', 'image': 'assets/images/r34.jpg', 'page': F1()},
  {'id': 9, 'name': 'Toyota', 'image': 'assets/images/supra.jpg', 'page': F1()},
  {
    'id': 10,
    'name': 'Rangerover',
    'image': 'assets/images/rangerover.jpg',
    'page': F1()
  },
];

class F1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(
            'CRISTIANO RONALDO   7',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 5,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(
                      'assets/images/f1.jpg',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 25),
                      child: Text(
                        "Cristiano Ronaldo dos Santos Aveiro, Premier League ekiplerinden Manchester United için forvet olarak oynayan ve Portekiz millî takımının kaptanlığını yapan Portekizli profesyonel bir futbolcudur.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Stack(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '91',
                                      style: TextStyle(fontSize: 38),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'ST',
                                      style: TextStyle(fontSize: 38),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '87 PAC',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '88 DRI',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '93 SHO',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '34 DEF',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '82 PAS',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '75 PHY',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Challenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(
            'CRISTIANO RONALDO   7',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 5,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(
                      'assets/images/ferrari.jpg',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 25),
                      child: Text(
                        "Cristiano Ronaldo dos Santos Aveiro, Premier League ekiplerinden Manchester United için forvet olarak oynayan ve Portekiz millî takımının kaptanlığını yapan Portekizli profesyonel bir futbolcudur.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Stack(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '91',
                                      style: TextStyle(fontSize: 38),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'ST',
                                      style: TextStyle(fontSize: 38),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '87 PAC',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '88 DRI',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '93 SHO',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '34 DEF',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '82 PAS',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '75 PHY',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
