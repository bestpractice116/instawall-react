import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/photo.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Photo;

    return Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFe1e1e1),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: const Color(0xFFe1e1e1),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "D E T A I L",
            style: TextStyle(color: Color(0xFF232323)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF232323),
              )),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            Column(children: [
              AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(args.urls.regular),
                  ),
                ),
              )
            ])
          ]),
        ));
  }
}
