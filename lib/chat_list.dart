import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chat_room.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);
  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final List _nFriendList = [];
  List chatRoomTitle = ['Neo', 'Booker', 'David', 'Christine', '홍길동', '도깨비', 'Dash', 'Evan', 'Huan', 'James', 'Jadey', 'Daniel'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            int imageId = Random().nextInt(1085);
            String _imageUri = 'https://picsum.photos/id/$imageId/100';
            String _name = chatRoomTitle[Random().nextInt(chatRoomTitle.length)];
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
            DateFormat format = DateFormat('MM월 dd일 $day HH시 mm분');
            String _formatted = format.format(now);
            _nFriendList.add({
              'image': _imageUri,
              'name': _name,
              'timeCreated': _formatted,
            });
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple[300],
      ),
      body: normalMode(),
    );
  }

  Widget normalMode() {
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

  Widget _item(String image, String name, String timeCreated, int index) {
    return ListTile(
      onLongPress: () {},
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoom(
              name: name,
              // image: image.substring(0, image.length - 3),
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
      // subtitle: Text(
      //   timeCreated,
      //   style: const TextStyle(
      //     color: Colors.black,
      //     fontSize: 15,
      //     fontWeight: FontWeight.w400,
      //   ),
      // ),
      trailing: Text(
        timeCreated,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      /* trailing: TextButton(
        onPressed: () {
          // if (mode) {
          //   setState(() {
          //     _nFriendList.removeAt(_nFriendList.length - index - 1);
          //   });
          // }
          // if (!mode) {
          //   setState(() {
          //     _sFriendList.removeAt(_sFriendList.length - index - 1);
          //   });
          // }
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
      ), */
    );
    /*  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendProfile(
                      image: image.substring(0, image.length - 3),
                      name: name,
                    ),
                  ),
                ); */
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
                  Column(
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
                      Text(
                        timeCreated,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TextButton(
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
              height: 110,
              child: Icon(
                Icons.delete_forever_outlined,
                size: 70,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    ); */
  }
}
