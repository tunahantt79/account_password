import 'package:flutter/material.dart';
import 'package:kullanici_sifre/share.dart';

class InfoPage extends StatefulWidget {
  final String appbarTitle;
  final String image;
  final String info;
  const InfoPage(
      {super.key,
      required this.appbarTitle,
      required this.image,
      required this.info});

  @override
  State<InfoPage> createState() => _DetayPageState();
}

class _DetayPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(widget.appbarTitle),
         // actions: [buildSocialButtons()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.white,
                    child: Image.network(widget.image),
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
                      widget.info,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
