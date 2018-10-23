import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestDataModel {
  final int userId;
  final String title;
  final String msgBody;

  TestDataModel(
    {
      this.userId,
      this.msgBody,
      this.title,
  });
  factory TestDataModel.fromJson(Map<String, dynamic> json) {
    return TestDataModel(
      userId: json['id'],
      title: json['title'],
      msgBody: json['body'],
    );

}
}
Future<List<TestDataModel>> fetchUserInfo() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return compute(parseResponse, response.body);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

List<TestDataModel> parseResponse(String responseBody){
final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TestDataModel>((json) => TestDataModel.fromJson(json)).toList();
}

class ServiceTestPage extends StatelessWidget {
  final String title;

  ServiceTestPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body:FutureBuilder<List<TestDataModel>>(
        future: fetchUserInfo(),
         builder: (context, data) {
          if (data.hasError) print(data.error);

          return data.hasData ? UserList(userInfo: data.data):
          Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  
}
class UserList extends StatelessWidget {
  final List<TestDataModel> userInfo;

  UserList(
    {Key key, this.userInfo}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
          padding:EdgeInsets.symmetric(vertical: 8.0),
          itemCount: userInfo.length,
          itemBuilder: (BuildContext context, int index){
            final String titleData = userInfo[index].title;
            final String desc = userInfo[index].msgBody;
            final String userId = userInfo[index].userId.toString();
           
            return new ListTile(
              isThreeLine: true,
              leading:new CircleAvatar(child: new Text(userId)),
              title: new Text(titleData),
              subtitle: new Text(desc),
               

            );
            
          },

        ),
      );
  }

}






/*
class ServiceTestPage extends StatefulWidget {
const ServiceTestPage({ Key key ,this.title}) : super(key: key);
final String title;
  @override
    _ServiceTestPageState createState() => new _ServiceTestPageState();

}

class _ServiceTestPageState extends State<ServiceTestPage> {

List<TestDataModel> _userList = <TestDataModel>[];

@override
  void initState() {
   
    super.initState();
    //_userList = fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Account List'),
      ),
      body: Center(
          child: FutureBuilder<TestDataModel>(
            
            future: fetchUserInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      
    );
  }

 
}*/