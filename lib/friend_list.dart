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
  final List _nFriendList = [
    // {'name': '피카츄', 'image': 'xxix__', 'timeCreated': '2022년 10월 1일 02시 33분 23초'},
    // {'name': '파이리', 'image': 'vix_v_', 'timeCreated': '2022년 12월 1일 02시 33분 23초'},
    // {'name': '꼬북이', 'image': 'xivxix_vv_', 'timeCreated': '2022년 11월 1일 02시 33분 23초'},
    // {'name': 'xuiu', 'image': 'xaaxevf', 'timeCreated': '2022년 11월 1일 02시 33분 23초'},
  ];
  final List _sFriendList = [];
  // Widget n = ListTile(title: Text('title'), subtitle: Text('subtitle'), leading: Icon(Icons.theaters));
  // Widget n = _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters);

  // List<ListTile> _list = [];

  // Widget _friendList = Column(children: [_list.]);
  String searchWord = '';
  final _controller = TextEditingController();

  bool mode = true; // true: normal mode, false: search mode
  List names = ['neo', 'booker', 'ㄱ무룐', 'david', 'christine', '홍길동', '도깨비', 'dash', 'evan', 'huan', 'james', 'jadey', 'daniel'];
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
    // print(_nFriendList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // foregroundColor: const Color(0xFFFFFFFF),
        // backgroundColor: const Color(0xFF000000),
        foregroundColor: Colors.black,
        backgroundColor: Colors.green[100],
        leading: const Center(
          child: Text(
            '친구',
            style: TextStyle(fontSize: 20),
          ),
        ),
        title: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: TextField(
                // controller: TextEditingController(),
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search Friends',
                  filled: true,
                  prefixIcon: const Icon(Icons.account_box, size: 28.0),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        // X버튼 클릭시
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() {
                            mode = true;
                            _sFriendList.clear();
                          });
                        },
                      ),
                      IconButton(
                          icon: const Icon(Icons.search),
                          // 돋보기버튼 클릭시
                          onPressed: () {
                            for (int i = 0; i < _nFriendList.length; i++) {
                              if (_nFriendList[i]['name'].contains(searchWord)) _sFriendList.add(_nFriendList[i]);
                            }
                            _controller.clear();
                            setState(() {
                              mode = false;
                            });
                          }),
                    ],
                  ),
                ),
                onChanged: (text) {
                  searchWord = text;
                },
                // textfield에서 엔터 칠시
                onSubmitted: (String text) {
                  for (int i = 0; i < _nFriendList.length; i++) {
                    if (_nFriendList[i]['name'].contains(searchWord)) _sFriendList.add(_nFriendList[i]);
                  }
                  _controller.clear();
                  setState(() {
                    mode = false;
                  });
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  int imageId = Random().nextInt(1085);
                  String _imageUri = 'https://picsum.photos/id/$imageId/100';
                  String _name = names[Random().nextInt(names.length)];
                  DateTime now = DateTime.now();
                  String day = DateFormat('E').format(now);
                  switch (day) {
                    case 'Mon':
                      day = '월';
                      break;
                    case 'Tue':
                      day = '화';
                      break;
                    case 'Wed':
                      day = '수';
                      break;
                    case 'Thu':
                      day = '목';
                      break;
                    case 'Fri':
                      day = '금';
                      break;
                    case 'Sat':
                      day = '토';
                      break;
                    case 'Sun':
                      day = '일';
                      break;
                    default:
                  }
                  DateFormat format = DateFormat('yyyy년 MM월 dd일 $day HH시 mm분 ss.SSS초');
                  String _formatted = format.format(now);
                  // Person p1 = Person(name: 'name', image: 'image', timeCreated: formatted);
                  _nFriendList.add({
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
        backgroundColor: Colors.green[100], //const Color(0xFF000000),
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.visibility_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: ''),
        ],
        selectedIconTheme: IconThemeData(
          color: Colors.red[900],
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
          size: 24,
        ),
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
      ),
      body: mode ? normalMode() : searchMode(),
    );
  }

  Widget normalMode() {
    print('normalMode');
    print('searchWord: $searchWord');
    return ListView.builder(
        itemCount: _nFriendList.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(
            _nFriendList[_nFriendList.length - index - 1]['image'],
            _nFriendList[_nFriendList.length - index - 1]['name'],
            _nFriendList[_nFriendList.length - index - 1]['timeCreated'],
            index,
          );
        });
  }

  Widget searchMode() {
    print('searchMode');
    print('searchWord: $searchWord');
    return ListView.builder(
        itemCount: _sFriendList.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(
            _sFriendList[_sFriendList.length - index - 1]['image'],
            _sFriendList[_sFriendList.length - index - 1]['name'],
            _sFriendList[_sFriendList.length - index - 1]['timeCreated'],
            index,
          );
        });
  }

  Widget _item(String image, String name, String timeCreated, int index) {
    return TextButton(
      onPressed: () {
        if (mode) {
          setState(() {
            _nFriendList.removeAt(_nFriendList.length - index - 1);
          });
        }
        if (!mode) {
          setState(() {
            _sFriendList.removeAt(_sFriendList.length - index - 1);
          });
        }
      },
      // onPressed: () {},
      child: SizedBox(
        height: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 100),
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  image,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network('https://picsum.photos/id/254/100');
                  },
                ),
              ),
            ),
            // Container(
            //   width: 200,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         image,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(width: 100),
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
                textAlign: TextAlign.center,
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
