import 'package:flutter/material.dart';

class FriendProfile extends StatefulWidget {
  String name;
  String image;

  FriendProfile({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);
  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  late String _image;
  @override
  initState() {
    super.initState();
    _image = widget.image + '300';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}'s Profile"),
        foregroundColor: Colors.blue[900],
        backgroundColor: Colors.green[100],
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150.0),
                child: Image.network(
                  // widget.image,
                  _image,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network('https://picsum.photos/id/254/300');
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
