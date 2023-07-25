import 'package:flutter/material.dart';
import 'package:sample_viewer/main.dart';

import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double sideLength = MediaQuery.of(context).size.width > largeBreakpoint ? 300 : 200;

    return SizedBox(
      width: sideLength,
      height: sideLength,
      child: Image.network(
        imageUrl,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            size: 100,
          );
        },
      ),
    );
  }
}

