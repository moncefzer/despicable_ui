import 'package:despicable_ui/core/context_ext.dart';
import 'package:despicable_ui/pages/character_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/character.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CharacterPage(character: character),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: 'background-${character.name}',
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  width: 0.9.sw,
                  height: 0.6.sh,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: character.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: Hero(
              tag: "image-${character.name}",
              child: Image.asset(
                character.imagePath,
                height: 0.6.sh,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h, left: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Hero(
                  tag: 'name-${character.name}',
                  child: Text(
                    character.name,
                    style: context.headlineMedium.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Read more",
                  style: context.headlineSmall.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const curveDistance = 40.0;

    final height = size.height;
    final width = size.width;

    path.moveTo(0, height * 0.4);
    path.lineTo(0, height - curveDistance);
    path.quadraticBezierTo(0, height - 0, curveDistance, height);
    path.lineTo(width - curveDistance, height);
    path.quadraticBezierTo(
        width + 0, height - 0, width, height - curveDistance);
    path.lineTo(width, curveDistance);
    path.quadraticBezierTo(
        width, 0, width - curveDistance - 5, curveDistance / 3);
    path.lineTo(curveDistance, height * 0.28);
    path.quadraticBezierTo(0, height * 0.3 + 10, 0, height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
