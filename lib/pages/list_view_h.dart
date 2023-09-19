import 'package:flutter/material.dart';
import 'package:learning_shared_preference/shared/app_images.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({super.key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 7,
                child: Image.asset(AppImages.image1),
              ),
              Card(
                elevation: 7,
                child: Image.asset(AppImages.image2),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
