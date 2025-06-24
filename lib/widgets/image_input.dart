import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return ImageInputState();
  }
}

class ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        onPressed: () {},
        icon: const Icon(Icons.camera),
        label: const Text("Take Picture"),
      ),
    );
  }
}
