import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_wall/firebase_options.dart';
import 'package:insta_wall/pages/detail_page.dart';
import 'package:insta_wall/pages/home_page.dart';
import 'package:insta_wall/services/firebase/photos_service.dart';
import 'package:insta_wall/services/unsplash/api_service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'services/unsplash/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ApiService()),
      ChangeNotifierProvider(create: (context) => PhotosService()),
    ],
    child: const InstaWall(),
  ));
}

class InstaWall extends StatelessWidget {
  const InstaWall({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Constants.initialRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Constants.detailRoute:
              return PageTransition(
                child: const DetailsPage(),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(seconds: 1),
                settings: settings,
              );
            case Constants.initialRoute:
              return PageTransition(
                child: const HomePage(),
                type: PageTransitionType.leftToRight,
                duration: const Duration(seconds: 1),
                settings: settings,
              );
            default:
              return null;
          }
        });
  }
}
