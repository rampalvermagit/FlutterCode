

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home.dart';


class StreamResponse{
  final String code;
  final String desc;
  final double actBalance;

StreamResponse({
 this.code,
   this.desc,
    this.actBalance,
 });


}
class StreamListnerPage extends StatefulWidget {
  
  StreamListnerPage({Key key}) : super(key: key);

final StreamController<StreamResponse> streamCntrl = StreamController<StreamResponse> ();
 //StreamController<StreamResponse> streamCntrl
  
  @override
    _StreamListnerPageState createState() {
   
      return _StreamListnerPageState();
    }
}

class _StreamListnerPageState extends State<StreamListnerPage> {
  
  //StreamController<StreamResponse> _streamController;
 StreamResponse _streamResponse = StreamResponse(
     code:'999999',
         desc: 'FIRST MESSAGE',
         actBalance: 999.99
 );
  double _incCounter = 0.0;

void _registerListner(){
      _incCounter = _incCounter+1;
       print('Stream Controller in StreamListnerPage ');
       widget.streamCntrl.stream.listen((data){
         print("Data received- DESC" + data.desc);
          print("Data received - Balance" + data.actBalance.toString());

       },onDone: () {
         print("TASK Completed");

       }, onError: (error) {
         print("Some Error" + error);

       });
}
  @override
    void initState() {
       super.initState();
      _registerListner();

    }

    @override
      void dispose() {
       widget.streamCntrl.close();
        super.dispose();
      }
  
 void _goback_to_home(){
   print('Post Notification');

   //Post notification
   setState(() {
      print('GO BACK');
        Navigator.push(context,  new MaterialPageRoute<DashboardPage>(
          builder: (BuildContext context) => new DashboardPage()

        ));
      });
   
 }

  @override
  Widget build(BuildContext context) {
     final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("STREAM/SINK Test"),
      ),
      body: Container(
       margin: EdgeInsets.all(10.0),
     // alignment: Alignment.center,
      
        child: Column(
          mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(_streamResponse.code),
           new Text(_streamResponse.desc),
            new Text(_streamResponse.actBalance.toString()),
  new RaisedButton(
            onPressed: _goback_to_home,
            child: Text('BACK TO HOME'),
  ),

        ],
      ),
      ),
    );
  }

}


