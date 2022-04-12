import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

void main() {
  // showLayoutGuidelines();
  runApp(const KakaoTalk());
}

class KakaoTalk extends StatefulWidget {
  const KakaoTalk({Key? key}) : super(key: key);
  @override
  State<KakaoTalk> createState() => _KakaoTalkState();
}

class _KakaoTalkState extends State<KakaoTalk> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KakaoTalk',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF000000),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('친구'),
          elevation: 0,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person_add_alt_1_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.music_note)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
        body: ListView(
          // https://docs.flutter.dev/development/ui/layout#listview
          children: [
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
            ListTile(
              title: Text('title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
