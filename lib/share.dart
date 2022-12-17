import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia { facebook, twitter, email, whatsapp, chrome }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Widget buildSocialButtons() => buildSocialButton(
    icon: Icons.ios_share_outlined,
    color: Colors.white,
    onClicked: () => share(SocialMedia.chrome));

Future share(SocialMedia socialPlatform) async {
  final subject = 'İzlemen gerek :)';
  final text = 'bugatti ';
  final urlShare = Uri.encodeComponent(
      'https://firebasestorage.googleapis.com/v0/b/account-password-app.appspot.com/o/arabalar%2Fbugatti.jpg?alt=media&token=e727e0ac-5420-4a4f-993a-36cfbbd6daae');

  final urls = {
    // SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$urlShare',
    // SocialMedia.twitter: 'https://twitter.com/intent/tweet?url=$urlShare',
    SocialMedia.chrome:
        'https://firebasestorage.googleapis.com/v0/b/account-password-app.appspot.com/o/arabalar%2Fbugatti.jpg?alt=media&token=e727e0ac-5420-4a4f-993a-36cfbbd6daae'
  };
  final url = urls[socialPlatform]!;

  if (await canLaunch(url)) {
    await launch(url);
  }
}

Widget buildSocialButton(
        {required IconData icon,
        required Color color,
        required Future Function() onClicked}) =>
    InkWell(
      child: Container(
        width: 64,
        height: 64,
        child: Center(
            child: FaIcon(
          icon,
          color: color,
          size: 40,
        )),
      ),
      onTap: onClicked,
    );
