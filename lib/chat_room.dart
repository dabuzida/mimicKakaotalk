import 'dart:math';

import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  String name;

  ChatRoom({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class _ChatRoomState extends State<ChatRoom> {
  final _controller = TextEditingController();
  final ScrollController _controller2 = ScrollController();

  List<ChatMessage> messages = [
    ChatMessage(messageContent: 'Hello, Will', messageType: 'receiver'),
    ChatMessage(messageContent: 'How have you been?\n zzzzzzz', messageType: 'receiver'),
    ChatMessage(messageContent: 'Hey Kriss, I am doing fine dude. wbu?', messageType: 'sender'),
    ChatMessage(messageContent: 'ehhhh, doing OK.', messageType: 'receiver'),
    ChatMessage(messageContent: 'Is there any thing wrong?', messageType: 'sender'),
    ChatMessage(messageContent: '1', messageType: 'sender'),
    ChatMessage(messageContent: '2', messageType: 'sender'),
    ChatMessage(messageContent: '3', messageType: 'receiver'),
    ChatMessage(messageContent: '4', messageType: 'sender'),
    ChatMessage(messageContent: '5', messageType: 'sender'),
    ChatMessage(messageContent: '6', messageType: 'receiver'),
    ChatMessage(messageContent: '7', messageType: 'sender'),
    ChatMessage(messageContent: '8', messageType: 'sender'),
    ChatMessage(messageContent: '9', messageType: 'receiver'),
  ];
  void _scrollDown() {
    _controller2.jumpTo(
      _controller2.position.maxScrollExtent,
      // duration: const Duration(milliseconds: 10),
      // curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          // style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
        ],
        foregroundColor: Colors.blue[900],
        backgroundColor: Colors.green[100],
        elevation: 0,
        // centerTitle: true,s
      ),
      body: SafeArea(
        child: ListView.builder(
          controller: _controller2,
          itemCount: messages.length,
          // shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          // physics: NeverScrollableScrollPhysics(), // 스크롤 막기
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (messages[index].messageType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    messages[index].messageContent,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.amber[100],
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            // hintText: 'Search Friends',
            // filled: true,
            // border: InputBorder.none,
            prefixIcon: IconButton(
              icon: const Icon(
                Icons.add_box_outlined,
                size: 28.0,
              ),
              onPressed: () {},
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  // X버튼 클릭시
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {},
                ),
                IconButton(
                    icon: const Icon(Icons.send),
                    // 돋보기버튼 클릭시
                    onPressed: () {}),
              ],
            ),
          ),
          onChanged: (text) {
            // searchWord = text;
          },
          // textfield에서 엔터 칠시
          onSubmitted: (String text) {
            setState(() {
              messages.add(ChatMessage(messageContent: text, messageType: Random().nextInt(2) == 0 ? 'sender' : 'receiver'));
              _controller.clear();
              // _scrollDown();
            });

            Future.delayed(const Duration(seconds: 1), () {
              _scrollDown();
            });
          },
        ),
      ),
    );
  }
}
