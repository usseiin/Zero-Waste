import 'package:flutter/material.dart';

import '../res/res.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(38),
          border: Border.all(color: Resources.color.primaryColor)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.notifications_none,
            color: Resources.color.black, size: 30),
      ),
    );
  }
}
