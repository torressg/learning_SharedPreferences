import 'package:flutter/material.dart';
import 'package:learning_shared_preference/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          AppImages.image1,
          height: 600,
        ),
        Image.asset(
          AppImages.image2,
          height: 600,
        ),
      ],
    );
  }
}
