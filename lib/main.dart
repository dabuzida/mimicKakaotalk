import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:mimic_kakaotalk/json_data.dart';
import 'package:mimic_kakaotalk/shopping.dart';
import 'package:provider/provider.dart';

import 'chat_list.dart';
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
    return const MaterialApp(
      title: 'mimic_kakaotalk',
      debugShowCheckedModeBanner: false,
      home: WidgetGate(),
    );
  }
}

class WidgetGate extends StatefulWidget {
  const WidgetGate({Key? key}) : super(key: key);

  @override
  State<WidgetGate> createState() => _WidgetGateState();
}

class _WidgetGateState extends State<WidgetGate> {
  int selectedIndex = 0;
  // static const List<Widget> widgets = <Widget>[
  //   FriendList(),
  //   ChatList(),
  //   Shopping(),
  //   JsonData(),
  // ];
  Widget _indexedStack() {
    return ChangeNotifierProvider<MyProfile>(
      create: (BuildContext context) => MyProfile(),
      child: IndexedStack(
        index: selectedIndex,
        children: const <Widget>[
          FriendList(),
          ChatList(),
          Shopping(),
          JsonData(),
        ],
      ),
    );
  }

/* 
IndexedStack(
        index: selectedIndex,
        children: const <Widget>[
          FriendList(),
          ChatList(),
          Text('none'),
          JsonData(),
        ],
      ),
 */

  void selectWidget(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[200],
      // floatingActionButton: selectedIndex == 0 ? FloatingActionButton(onPressed: () {}) : null,
      appBar: selectedIndex == 0
          ? AppBar(
              title: const Text('Friend List'),
              elevation: 0,
              foregroundColor: Colors.blue[900],
              backgroundColor: Colors.green[100],
              centerTitle: true,
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.person_add_alt_1_outlined)), // 친구추가버튼
                IconButton(onPressed: () {}, icon: const Icon(Icons.music_note_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings_sharp)),
              ],
            )
          : selectedIndex == 1
              ? AppBar(
                  title: const Text('Chat List'),
                  elevation: 0,
                  foregroundColor: Colors.blue[900],
                  backgroundColor: Colors.green[100],
                  centerTitle: true,
                )
              : selectedIndex == 2
                  ? AppBar(
                      title: const Text('Shopping'),
                      elevation: 0,
                      foregroundColor: Colors.blue[900],
                      backgroundColor: Colors.green[100],
                      centerTitle: true,
                    )
                  : AppBar(
                      title: const Text('JSON Data'),
                      elevation: 0,
                      foregroundColor: Colors.blue[900],
                      backgroundColor: Colors.green[100],
                      centerTitle: true,
                    ),
      body: _indexedStack(),
      // body: widgets.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // ?
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.green[100],
        currentIndex: selectedIndex,
        onTap: selectWidget,
        selectedItemColor: Colors.red[900],
        unselectedItemColor: Colors.blue[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility_outlined),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash),
            label: 'JSON Data',
          ),
        ],
      ),
    );
  }
}

class MyProfile extends ChangeNotifier {
  int _counter = 0;
  final String _name = 'Dash';

  int get counter => _counter;
  String get name => _name;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
