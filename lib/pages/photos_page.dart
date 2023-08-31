import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  int _current = 0;
  List<String> categories = ["Nature", "1", "2", "3", "5", "5", "7"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _current = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                          color: _current == index
                              ? const Color(0xFFc7c7c7)
                              : const Color(0xFFe1e1e1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(child: Text(categories[index])),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
