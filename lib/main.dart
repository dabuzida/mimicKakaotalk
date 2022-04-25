import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'friend_list.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

void main() {
  // showLayoutGuidelines();
  runApp(const KakaoTalk());
}

class KakaoTalk extends StatelessWidget {
  const KakaoTalk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KakaoTalk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // brightness: Brightness.dark,
          // primaryColor: const Color(0xFF5511dd),
          // primarySwatch: Color(0xFFFFFFFF),
          ),
      home: const FriendList(),
    );
  }
}
