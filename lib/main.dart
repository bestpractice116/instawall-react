import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insta_wall/models/user_links.dart';
import 'package:insta_wall/pages/detail_page.dart';
import 'package:insta_wall/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'models/download_links.dart';
import 'models/photo.dart';
import 'models/profile_image.dart';
import 'models/url.dart';
import 'models/user.dart';
import 'services/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("photo_box");
  Hive.registerAdapter(PhotoAdapter());
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(DownloadLinksAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProfileImageAdapter());
  Hive.registerAdapter(UserLinksAdapter());

  runApp(
    const InstaWall(),
  );
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
