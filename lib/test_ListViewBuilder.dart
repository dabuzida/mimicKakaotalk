import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  // equation, result를 쌍으로 보관하고 다루는 자료구조 고르기
  // ListView.builder에 key, value를 분리해서 다루는 방법
  final List<String> entries = <String>['A', 'B', 'C', 'B', 'C', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100, 500, 100, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.grey,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            }),
      ),
    );
  }
}
