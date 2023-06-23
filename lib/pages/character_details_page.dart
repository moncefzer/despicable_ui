import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:despicable_ui/core/context_ext.dart';

import '../models/character.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            child: _buildCharacterContent(context),
          ),
          ShowUpAnimation(
            child: DraggableScrollableSheet(
              maxChildSize: 0.5,
              minChildSize: 0.07,
              initialChildSize: 0.07,
              snap: true,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  clipBehavior: Clip.none,
                  child: Container(
                    padding: EdgeInsets.all(15.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.w),
                        topRight: Radius.circular(30.w),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Clips',
                          style:
                              context.headlineMedium.copyWith(fontSize: 24.sp),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            character.imagePath,
                            height: 0.5.sh,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.clear,
          color: Colors.white,
          size: 30.w,
        ),
      ),
    );
  }

  Padding _buildCharacterContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.topRight,
            child: Hero(
              tag: "image-${character.name}",
              child: Image.asset(
                character.imagePath,
                height: 0.4.sh,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Hero(
            tag: 'name-${character.name}',
            child: Text(
              character.name,
              style: context.headlineMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ShowUpAnimation(
            child: Text(
              character.description,
              style: context.titleLarge.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontSize: 17.sp,
                fontWeight: FontWeight.w900,
                wordSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 0.07.sh),
        ],
      ),
    );
  }

  Hero _buildBackground() {
    return Hero(
      tag: 'background-${character.name}',
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: character.colors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
    );
  }
}

class ShowUpAnimation extends StatefulWidget {
  const ShowUpAnimation({
    super.key,
    required this.child,
    this.duraction = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duraction;

  @override
  State<ShowUpAnimation> createState() => _ShowUpAnimationState();
}

class _ShowUpAnimationState extends State<ShowUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duraction,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(_controller),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: const Offset(0, 0),
        ).animate(_controller),
        child: widget.child,
      ),
    );
  }
}
