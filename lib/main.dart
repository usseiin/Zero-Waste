import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/res.dart';
import 'provider/add_new_conversation.dart';
import 'provider/chat_data.dart';
import 'provider/connections.dart';
import 'provider/market_data.dart';
import 'provider/product_data.dart';
import 'provider/feed_data.dart';
import 'provider/user_data.dart';
import 'utils/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatData()),
        ChangeNotifierProvider(create: (context) => ConnectionsProvider()),
        ChangeNotifierProvider(create: (context) => ConversationsProvider()),
        ChangeNotifierProvider(create: (context) => FeedData()),
        ChangeNotifierProvider(create: (context) => UserAuth()),
        ChangeNotifierProvider(create: (context) => ProductData()),
        ChangeNotifierProvider(create: (context) => MarketData()),
      ],
      child: const ZeroWaste(),
    ),
  );
}

final GlobalKey<NavigatorState> mainAppKey = GlobalKey<NavigatorState>();

class ZeroWaste extends StatelessWidget {
  const ZeroWaste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: routes,
      navigatorKey: mainAppKey,
      theme: ThemeData(primarySwatch: Resources.color.appColor),
      debugShowCheckedModeBanner: false,
      title: 'Zero Waste',
    );
  }
}
