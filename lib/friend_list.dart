import 'package:flutter/material.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);
  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  // @override
  // void initState() {
  //   print('hi');
  //   Widget n = _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters);
  //   _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
  // }

  // Widget n = ListTile(title: Text('title'), subtitle: Text('subtitle'), leading: Icon(Icons.theaters));
  // Widget n = _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters);

  // List<ListTile> _list = [];

  // Widget _friendList = Column(children: [_list.]);

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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFF000000),
        title: const Text('친구'),
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  // _friendList
                  // _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters);
                });
              },
              icon: const Icon(Icons.person_add_alt_1_outlined)),
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Text('dd');
          }),
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
