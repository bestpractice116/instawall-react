import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/row_user_data.dart';
import '../models/photo.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Photo;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFf5f5f5),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFFf5f5f5),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xFF232323),
                      )),
                )),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.network(
                    args.urls.full,
                    width: double.infinity,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RowUserData(
                    photo: args,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
