
import 'dart:async';
import 'package:flutter/material.dart';


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
class StreamControllerTestPage extends StatefulWidget {
   @override
  _StreamControllerTestPageState createState() => _StreamControllerTestPageState();
  
  }

class _StreamControllerTestPageState extends State<StreamControllerTestPage> {
  StreamController<StreamResponse> _streamController;
 StreamResponse _streamResponse = StreamResponse(
     code:'999999',
         desc: 'FIRST MESSAGE',
         actBalance: 999.99
 );
  double _incCounter = 0.0;

  @override
    void initState() {
       super.initState();
        _incCounter = _incCounter+1;
       print('Stream Controller ');
       _streamController =  StreamController();
       _streamController.stream.listen((data){
         print("Data received- DESC" + data.desc);
          print("Data received - Balance" + data.actBalance.toString());

       },onDone: () {
         print("TASK Completed");

       }, onError: (error) {
         print("Some Error" + error);

       });

    }

    @override
      void dispose() {
       _streamController.close();
        super.dispose();
      }
  
 void _streamTest_clicked(){
   print('Post Notification');

   //Post notification
   setState(() {
      _incCounter = _incCounter+2;
        _streamResponse = StreamResponse(
      code:'10001' +  _incCounter.toString(),
         desc: 'Test Notification' +  _incCounter.toString(),
         actBalance: 234.09 + _incCounter
   );
       _streamController.add(_streamResponse);
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
            onPressed: _streamTest_clicked,
            child: Text('Send Notification'),
  ),

        ],
      ),
      ),
    );
  }

}