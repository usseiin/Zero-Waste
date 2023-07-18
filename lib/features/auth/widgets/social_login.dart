import 'package:flutter/material.dart';

import '../../../../service/firebase_social_auth.dart';
import '../../../../shared/res.dart';
import '../../../../views/tabs.dart';


class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);
  Container _login(Widget child) {
    return Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final socialAuth = SocialAuth();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            socialAuth.signInWithFacebook().whenComplete(
                () => Navigator.pushReplacementNamed(context, AppPages.id));
          },
          child: _login(Image.asset(Resources.iString.facebook)),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            socialAuth.signInWithGoogle().whenComplete(
                () => Navigator.pushReplacementNamed(context, AppPages.id));
          },
          child: _login(Image.asset(Resources.iString.google)),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {},
          child: _login(Image.asset(Resources.iString.linkedIn)),
        ),
      ],
    );
  }
}