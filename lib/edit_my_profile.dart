import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({Key? key}) : super(key: key);

  @override
  State<EditMyProfile> createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit My Profile'),
        foregroundColor: Colors.blue[900],
        backgroundColor: Colors.green[100],
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<MyProfile>(
              builder: (context, myProfile, child) {
                return Text('현재 나의 이름: ${myProfile.name}');
              },
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'edit profile',
                  // filled: true,
                  // prefixIcon: const Icon(Icons.account_box, size: 28.0),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      // _controller.clear();
                      // setState(() {
                      //   mode = true;
                      //   _sFriendList.clear();
                      // });
                    },
                  ),
                ),
                onChanged: (text) {},
                onSubmitted: (String text) {
                  // for (int i = 0; i < _nFriendList.length; i++) {
                  //   if (_nFriendList[i]['name'].contains(searchWord)) _sFriendList.add(_nFriendList[i]);
                  // }
                  // _controller.clear();
                  // setState(() {
                  //   mode = false;
                  // });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
