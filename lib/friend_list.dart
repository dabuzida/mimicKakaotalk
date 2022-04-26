import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'person.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);
  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final List _friendLIst = [
    // {'name': '피카츄', 'image': 'xxix__', 'timeCreated': '2022년 10월 1일 02시 33분 23초'},
    // {'name': '파이리', 'image': 'vix_v_', 'timeCreated': '2022년 12월 1일 02시 33분 23초'},
    // {'name': '꼬북이', 'image': 'xivxix_vv_', 'timeCreated': '2022년 11월 1일 02시 33분 23초'},
    // {'name': 'xuiu', 'image': 'xaaxevf', 'timeCreated': '2022년 11월 1일 02시 33분 23초'},
  ];
  // Widget n = ListTile(title: Text('title'), subtitle: Text('subtitle'), leading: Icon(Icons.theaters));
  // Widget n = _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters);

  // List<ListTile> _list = [];

  // Widget _friendList = Column(children: [_list.]);
  String search = '';
  List names = ['neo', 'booker', 'david', 'christine', 'dash', 'evan', 'huan', 'james', 'jadey', 'daniel'];
  // List images = ['a.jpg', 'b.jpg', 'c.jpg', 'd.jpg', 'e.jpg', 'f.jpg', 'g.jpg', 'h.jpg', 'i.jpg'];
  // 이미지는 랜덤 url로
  // https://picsum.photos/50
  // https://picsum.photos/id/237/50   // 0~1084
  // https://picsum.photos/id/'${number}/50
  /* 
    ListTile(
          title: Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black54,
              )),
          subtitle: Text(subtitle),
          leading: Icon(
            icon,
            color: Colors.blue[500],
          ),
        );

 */

  @override
  Widget build(BuildContext context) {
    print(_friendLIst);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFF000000),
        leading: const Center(
          child: Text(
            '친구',
            style: TextStyle(fontSize: 20),
          ),
        ),
        title: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  int imageId = Random().nextInt(1085);
                  String _imageUri = 'https://picsum.photos/id/$imageId/100';
                  String _name = names[Random().nextInt(names.length)];
                  DateTime now = DateTime.now();
                  DateFormat format = DateFormat('yyyy년 MM월 dd일 E HH시 mm분 ss.SSS초');
                  String _formatted = format.format(now);
                  // Person p1 = Person(name: 'name', image: 'image', timeCreated: formatted);
                  _friendLIst.add({
                    'image': _imageUri,
                    'name': _name,
                    'timeCreated': _formatted,
                  });
                  // _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters);
                });
              },
              icon: const Icon(Icons.person_add_alt_1_outlined)), // 친구추가버튼
          IconButton(onPressed: () {}, icon: const Icon(Icons.music_note_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_sharp)),
        ],
        // bottom: // 카카오톡_뷰 페이지에 필요
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: const Color(0xFF000000), // <-- This works for fixed
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.visibility_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: ''),
        ],
        selectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 206, 236, 37),
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
          size: 24,
        ),
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
      ),
      body: search.isEmpty ? normalMode() : searchMode(),
    );
  }

  Widget normalMode() {
    return ListView.builder(
        itemCount: _friendLIst.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(_friendLIst[_friendLIst.length - index - 1]['image'], _friendLIst[_friendLIst.length - index - 1]['name'], _friendLIst[_friendLIst.length - index - 1]['timeCreated'], index);
        });
  }

  Widget searchMode() {
    return ListView.builder(
        // itemCount: vi.length,
        itemBuilder: (BuildContext context, int index) {
      return Text('sdfsdfsdf');
    });
  }

  Widget _item(String image, String name, String timeCreated, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _friendLIst.removeAt(_friendLIst.length - index - 1);
        });
      },
      child: SizedBox(
        height: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 400, child: Image.network(image)),
            SizedBox(
              width: 300,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                timeCreated,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Column(
      children: [
        /*  _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant), */
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black54,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}
