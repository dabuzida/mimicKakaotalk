import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return MaterialApp(
      title: 'KakaoTalk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // brightness: Brightness.dark,
          // primaryColor: const Color(0xFF5511dd),
          // primarySwatch: Color(0xFFFFFFFF),
          ),
//       home: const WidgetGate(),
//     );
//   }
// }
      home: const FriendList(),
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
  static const List<Widget> widgets = <Widget>[
    FriendList(),
    ChatList(),
  ];

  void selectWidget(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Text('flutter sample'),
        elevation: 0,
        foregroundColor: Colors.yellow[300],
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Center(
        child: widgets.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: selectWidget,
        selectedItemColor: Colors.cyanAccent[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'i',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco_outlined),
            label: 'ii',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'iii',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.church),
            label: 'iv',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'v',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
