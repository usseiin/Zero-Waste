import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste/models/user.dart';
import 'package:zero_waste/providers/user_data.dart';
import 'package:zero_waste/res/res.dart';
import 'package:zero_waste/views/home_screen/home/farmer_types.dart';
import 'package:zero_waste/widgets/list_views/market_view_builder.dart';

import '../../../widgets/app_bars/home_appbar.dart';

class Home extends StatefulWidget {
  static const id = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<UserAuth>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [
              FutureBuilder<Farmer?>(
                future: loggedUser.farmer,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data;
                    return ProfileBar(userName: user!.name);
                  } else {
                    return const ProfileBar(userName: '');
                  }
                },
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 120,
                color: Resources.color.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'How to use the app.',
                          style: GoogleFonts.jost(
                              color: Resources.color.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Text(
                          'Learn about all the features of the app.',
                          style: GoogleFonts.jost(
                              color: Resources.color.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle),
                        ),
                      ],
                    ),
                    Image.asset(Resources.iString.book,
                        width: 100, height: 100),
                  ],
                ),
              ),
              //Second Container
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Resources.color.tField),
                  color: Resources.color.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Contract Farmer.',
                          style: GoogleFonts.jost(
                              color: Resources.color.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Text(
                          'Grow crops and sell your wastes \n'
                          'produce to other farmers.',
                          style: GoogleFonts.jost(
                              color: Resources.color.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          softWrap: true,
                        ),
                        TextButton(
                          onPressed: () => pushNewScreen(context,
                              screen: const UserCategories()),
                          style: TextButton.styleFrom(
                            minimumSize: const Size(87, 37),
                            backgroundColor: Resources.color.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            'Get Chats',
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Resources.color.white),
                          ),
                        )
                      ],
                    ),
                    Image.asset(Resources.iString.chat,
                        width: 100, height: 120),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market View',
                    style: GoogleFonts.jost(
                        color: Resources.color.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.jost(
                        color: Resources.color.tField,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ],
              ),
              const MarketViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}