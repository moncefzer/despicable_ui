import 'package:despicable_ui/core/context_ext.dart';
import 'package:despicable_ui/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/character_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 25.w,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 25.w,
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Despicable Me',
                  style: context.headlineMedium.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                Text('Characters', style: context.titleLarge),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return CharacterWidget(character: characters[index]);
              },
              itemCount: characters.length,
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
