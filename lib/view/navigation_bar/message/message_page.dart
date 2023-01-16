import 'package:flutter/material.dart';
import 'package:kullanici_sifre/view/navigation_bar/message/service.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _service = FirebaseNotificationService();
  @override
  void initState() {
    super.initState();
    _service.connectNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Mesajlar'),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
