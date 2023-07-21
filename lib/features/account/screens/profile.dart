import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste/features/products/widgets/profile_image_clipper.dart';
import 'package:zero_waste/widgets/user_avatar.dart';
import '../../../config/constant.dart';
import '../../../config/res.dart';
import '../../../provider/authenticate.dart';
import '../../../provider/product_data.dart';
import '../widgets/profile_stats_widget.dart';

class ProfileAccount extends StatelessWidget {
  static const id = 'ProfileAccount';
  const ProfileAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserAuth>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: Resources.color.black),
          ),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.jost(
              color: Resources.color.black,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    decoration: const BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const UserAvatar(),
                        const SizedBox(height: 2),
                        Text(
                          '${profile.user?.name}',
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Resources.color.white),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${profile.user?.typeOfFarmer}',
                          style: GoogleFonts.jost(color: Resources.color.white),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${profile.user?.homeAddress}',
                          style: GoogleFonts.jost(color: Resources.color.white),
                        ),
                        const SizedBox(height: 16),
                        const Wrap(
                          spacing: 17,
                          children: [
                            ProfileStats(category: 'Followers'),
                            ProfileStats(category: 'Following'),
                            ProfileStats(category: 'Posts'),
                            ProfileStats(category: 'Comments'),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 68, vertical: 12),
                            backgroundColor:
                                const Color.fromRGBO(21, 195, 137, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          child: const Text('Edit Profile'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Resources.color.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'My Posts',
                          style: GoogleFonts.jost(
                              fontSize: 20,
                              color: Resources.color.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromRGBO(233, 233, 233, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Saved Posts',
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              color: Resources.color.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Consumer<ProductData>(
              builder: (context, userPosts, child) {
                return Flexible(
                  child: GridView.builder(
                    itemCount: userPosts.products.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 18,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 121,
                        width: 154,
                        decoration: BoxDecoration(
                          color: Resources.color.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.2),
                              offset: const Offset(3, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          child: Image.network(
                            userPosts.products[index].productImage,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
