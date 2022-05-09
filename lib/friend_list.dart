import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mimic_kakaotalk/main.dart';
import 'package:provider/provider.dart';

import 'friend_profile.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);
  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final List _list = [
    {
      'name': '피카츄',
      'image': 'myprofile.jpg',
      'timeCreated': '2022년 10월 1일 02시 33분 23초',
      'isHost': true,
    }
  ];
  final List names = ['Neo', 'Booker', 'ㄱ무룐', 'David', 'Christine', '홍길동', '도깨비', 'Will', 'Can', 'Evan', 'Huan', 'James', 'Jadey', 'Daniel'];
  late List _friendList;

  final _controller = ScrollController();

  // bool mode = true; // true: normal mode, false: search mode
  // final List _sFriendList = [];
  // String searchWord = '';
  // 이미지는 랜덤 url로
  // https://picsum.photos/50
  // https://picsum.photos/id/237/50   // 0~1084
  // https://picsum.photos/id/'${number}/50

  @override
  void initState() {
    super.initState();
    _friendList = List.from(_list);
  }

  @override
  Widget build(BuildContext context) {
    print('1');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          setState(() {
            int imageId = Random().nextInt(16) + 1;
            String _imageUri = 'animal$imageId.jpg';
            // int imageId = Random().nextInt(1085);
            // String _imageUri = 'https://picsum.photos/id/$imageId/100';
            String _name = names[Random().nextInt(names.length)];
            String _formatted = makeCreationTime();
            bool _isHost = false;
            _list.add({
              'image': _imageUri,
              'name': _name,
              'timeCreated': _formatted,
              'isHost': _isHost,
            });

            if (_list.length <= 2) {
              _friendList = List.from(_list);
            } else if (_list.length > 2) {
              // 3개 이상이면, 작업해서 _nFriendList을 의도대로 정렬
              _friendList = List.from(_list);
              List front = _friendList.sublist(0, 1);
              List back = _friendList.sublist(1, _friendList.length);
              _friendList = front + back.reversed.toList();
            }
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.pink[300],
      ),

      /* 
        title: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Friends',
                  filled: true,
                  prefixIcon: const Icon(Icons.account_box, size: 28.0),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
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
        // bottom: // 카카오톡_뷰 페이지에 필요
      ), */
      body: Column(
        children: <Widget>[
          Consumer<MyProfile>(
            builder: (context, myProfile, child) {
              return SizedBox(
                height: 100,
                child: TextButton(
                  onPressed: () {
                    print(_friendList);
                  },
                  child: Text(myProfile.name),
                ),
              );
            },
          ),
          SizedBox(height: 700, child: normalMode()),
        ],
      ),
      // body: mode ? normalMode() : searchMode(),
    );
  }

  Widget normalMode() {
    // print('normalMode');
    // print('searchWord: $searchWord');
    return ListView.builder(
        controller: _controller,
        itemCount: _friendList.length,
        // itemCount: _friendList.length,
        itemBuilder: (BuildContext context, int index) {
          // return _item(
          //   _friendList[index]['image'],
          //   _friendList[index]['name'],
          //   _friendList[index]['timeCreated'],
          //   index,
          // );

          return _item(
            _friendList[index]['image'],
            _friendList[index]['name'],
            _friendList[index]['timeCreated'],
            _friendList[index]['isHost'],
            index,
          );

          // return _item(
          //   _nFriendList[_nFriendList.length - index - 1]['image'],
          //   _nFriendList[_nFriendList.length - index - 1]['name'],
          //   _nFriendList[_nFriendList.length - index - 1]['timeCreated'],
          //   index,
          // );
        });
  }

  Widget _item(String image, String name, String timeCreated, bool isHost, int index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 110,
            color: Colors.blueGrey[50],
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendProfile(
                      image: image.substring(0, image.length - 3),
                      image2: image,
                      name: name,
                      isHost: isHost,
                    ),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      // child: Image.asset('assets/animal/animal12.jpg',
                      child: Image(
                        image: AssetImage('profile/$image'),
                        // child: Image.network(
                        //   image,
                        errorBuilder: (context, error, stackTrace) {
                          // return Image.network('https://picsum.photos/id/254/100');
                          return Image.asset('meerkat.jpg');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FittedBox(
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
                ],
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _friendList.removeAt(_friendList.length - index - 1);
            });
          },
          child: SizedBox(
            width: 70,
            height: 110,
            child: Icon(
              Icons.delete_forever_outlined,
              size: 70,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }
  /* Widget _item(String image, String name, String timeCreated, int index) {
    return /* ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FriendProfile(
              image: image.substring(0, image.length - 3),
              name: name,
            ),
          ),
        );
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          image,
        ),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.black,
          // fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        timeCreated,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: TextButton(
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
        child: SizedBox(
          width: 70,
          // height: 110,
          child: Icon(
            Icons.delete_forever_outlined,
            size: 50,
            color: Colors.grey[400],
          ),
        ),
      ),
    ); */

        Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 110,
            color: Colors.blueGrey[50],
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendProfile(
                      image: image.substring(0, image.length - 3),
                      name: name,
                    ),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FittedBox(
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
                ],
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _friendList.removeAt(_friendList.length - index - 1);
            });
          },
          child: SizedBox(
            width: 70,
            height: 110,
            child: Icon(
              Icons.delete_forever_outlined,
              size: 70,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  } */

  String makeCreationTime() {
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
    return format.format(now);
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
