import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonData extends StatefulWidget {
  const JsonData({Key? key}) : super(key: key);

  @override
  State<JsonData> createState() => _JsonDataState();
}

class Json {
  late int userId;
  late int id;
  late String title;
  late String body;
  Json({required this.userId, required this.id, required this.title, required this.body});

  Json.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  /* factory Json.fromJson(Map<String, dynamic> json) {
    return Json(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  } */
}

Future<List<Json>> fetchPost() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    List list = jsonDecode(response.body);
    List<Json> jsonList = list.map((e) => Json.fromJson(e)).toList();
    return jsonList;
    // return Json.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class _JsonDataState extends State<JsonData> {
  late Future<List<Json>> json;

  @override
  void initState() {
    super.initState();
    json = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Json>>(
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
                    leading: Text(json.id.toString()),
                    title: Text(json.title),
                    subtitle: Text(json.body),
                    trailing: Text(json.userId.toString()),
                  ),
                );
                // return Card(child: ListTile(title: Text(json.title)));
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // 기본적으로 로딩 Spinner를 보여줍니다.
        return CircularProgressIndicator();
      },
    );
  }
}
