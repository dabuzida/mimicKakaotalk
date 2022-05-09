import 'package:flutter/material.dart';
import 'package:mimic_kakaotalk/edit_my_profile.dart';

class FriendProfile extends StatefulWidget {
  String name;
  String image;
  String image2;
  bool isHost;
  FriendProfile({
    Key? key,
    required this.name,
    required this.image,
    required this.image2,
    required this.isHost,
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
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                // child: Image.network(
                //   // widget.image,
                //   _image,
                //   errorBuilder: (context, error, stackTrace) {
                //     return Image.network('https://picsum.photos/id/254/300');
                //   },
                // ),
                child: Image(
                  image: AssetImage('profile/${widget.image2}'),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('meerkat.jpg');
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                if (widget.isHost) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditMyProfile(),
                    ),
                  );
                }
              },
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
