import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste/provider/camera.dart';
import '../../../config/res.dart';
import '../../../provider/authenticate.dart';
import 'profile.dart';
import '../widgets/profile_tile.dart';
import '../../../main.dart';
import '../../../widgets/user_avatar.dart';
import '../../auth/screens/signup-login/login_screen.dart';

class MyAccount extends StatelessWidget {
  static const id = 'MyAccount';
  const MyAccount({Key? key}) : super(key: key);

  _showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Get images from: '),
          title: Text(
            'Upload Images',
            style: GoogleFonts.jost(
              color: Resources.color.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<Camera>().getImage(ImageSource.camera);
                Navigator.pop(context);
              },
              child: Text(
                'Camera',
                style: TextStyle(color: Resources.color.primary),
              ),
            ),
            TextButton(
              onPressed: () async {
                context.read<Camera>().getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              child: Text(
                'Gallery',
                style: TextStyle(color: Resources.color.primary),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<UserAuth>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Account',
          style: GoogleFonts.jost(
              color: Resources.color.black,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const UserAvatar(),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => _showAlertDialog(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          side: BorderSide(color: Resources.color.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: Text(
                          'Upload Images',
                          style: TextStyle(
                              color: Resources.color.hintText, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${account.user?.username}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Resources.color.black),
                      ),
                      Text(
                        '${account.user?.farmerType}',
                        style: TextStyle(color: Resources.color.hintText2),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileTileOption(
                  icon: Icons.person_2_rounded,
                  option: 'My Profile',
                  onTap: () => pushNewScreen(
                    context,
                    screen: const ProfileAccount(),
                  ),
                ),
                const SizedBox(height: 20),
                ProfileTileOption(
                    icon: Icons.person_add_alt_1,
                    option: 'Invite',
                    onTap: () {}),
                const SizedBox(height: 20),
                ProfileTileOption(
                  icon: Icons.cloud_upload_rounded,
                  option: 'Upload content',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileTileOption(
                  icon: Icons.settings,
                  option: 'Settings',
                  onTap: () {},
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () async {
                // await FirebaseAuth.instance.signOut();
                mainAppKey.currentState!.popAndPushNamed(LoginScreen.id);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 138, vertical: 14)),
              child: Text(
                "Sign out",
                style: GoogleFonts.jost(
                    color: Resources.color.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
