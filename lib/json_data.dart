import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonData extends StatefulWidget {
  const JsonData({Key? key}) : super(key: key);

  @override
  State<JsonData> createState() => _JsonDataState();
}

class Json {
  late String userId;
  late String id;
  late String title;
  late String body;

  Json.fromJson(Map<String, dynamic> json) {
    userId = json['userId'].toString();
    id = json['id'].toString();
    title = json['title'];
    body = json['body'];
  }
  /* Json({required this.userId, required this.id, required this.title, required this.body});
  factory Json.fromJson(Map<String, dynamic> json) {
    return Json(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  } */
}

Future<List<Json>> fetchPost() async {
  String jsonRawData;
  List jsonList;
  List<Json> jsonTransformed;
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  await Future.delayed(const Duration(seconds: 1));
  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    jsonRawData = response.body;
    jsonList = jsonDecode(jsonRawData);
    jsonTransformed = jsonList.map((e) => Json.fromJson(e)).toList();
    print('${jsonRawData.runtimeType} >> $jsonRawData');
    print('${jsonList.runtimeType} >> $jsonList');
    print('${jsonTransformed.runtimeType} >> $jsonTransformed');
    return jsonTransformed;
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class _JsonDataState extends State<JsonData> {
  late List<Json> jsonTransformed; // 1
  late Future<List<Json>> json; // 2
  bool flag = false;

  requestData() async {
    String jsonRawData;
    List jsonList;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    await Future.delayed(const Duration(seconds: 1));

    if (response.statusCode == 200) {
      // jsonRawData(String, List) >> jsonList(List, dynamic) >> jsonTransformed (List, Json)
      jsonRawData = response.body;
      jsonList = jsonDecode(jsonRawData);
      jsonTransformed = jsonList.map((e) => Json.fromJson(e)).toList();
      print('${jsonRawData.runtimeType} >> $jsonRawData');
      print('${jsonList.runtimeType} >> $jsonList');
      print('${jsonTransformed.runtimeType} >> $jsonTransformed');
      setState(() {
        flag = true;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    requestData(); // 1
    // json = fetchPost(); // 2
  }

  @override
  Widget build(BuildContext context) {
    // 1: Without FutureBuilder, output json data received from json server
    return Center(
      child: flag
          ? ListView.builder(
              itemCount: jsonTransformed.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(jsonTransformed[index].userId),
                  title: Text(jsonTransformed[index].title),
                  subtitle: Text(jsonTransformed[index].body),
                  trailing: Text(jsonTransformed[index].id),
                );
              })
          : Image.network('https://c.tenor.com/7NX24XoJX0MAAAAC/loading-fast.gif'),
    );

    // 2: With FutureBuilder, output json data received from json server
    /* return FutureBuilder<List<Json>>(
      future: json, // a previously-obtained Future<String> or null
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              controller: ScrollController(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Json json = snapshot.data![index];
                return TextButton(
                  onPressed: () {},
                  child: ListTile(
                    leading: Text(json.id),
                    title: Text(json.title),
                    subtitle: Text(json.body),
                    trailing: Text(json.userId),
                  ),
                );
                // return Card(child: ListTile(title: Text(json.title)));
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // 기본적으로 로딩 Spinner를 보여줍니다.
        return Center(child: CircularProgressIndicator());
      },
    ); */
  }
}
