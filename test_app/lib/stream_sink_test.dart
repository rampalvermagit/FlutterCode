

import 'dart:async';

import 'package:flutter/material.dart';

import './stream_listner.dart';


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
class StreamSinkTestPage extends StatefulWidget {
   @override
  _StreamSinkTestPageState createState() => _StreamSinkTestPageState();
  
  }

class _StreamSinkTestPageState extends State<StreamSinkTestPage> {
 StreamController<StreamResponse> streamCcontroller = StreamController<StreamResponse> ();

StreamResponse _streamResponse = StreamResponse(
     code:'999999',
         desc: 'FIRST MESSAGE',
         actBalance: 999.99
 );
  int _incCounter = 1;
//TIMER 
Timer timer;
void tick(_) {
  setState(() {
    _incCounter++;
    _streamResponse = StreamResponse(
     code:'8000' + _incCounter.toString(),
         desc: 'MESSAGE' + _incCounter.toString(),
         actBalance: 999.99 + _incCounter
 );
    streamCcontroller.add(_streamResponse); 
    if (_incCounter == 10) {
      timer.cancel();
      streamCcontroller.close(); 
    }
  });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

void setListner(){
       _incCounter = _incCounter+1;
       print('Stream Controller ');
      streamCcontroller = StreamController<StreamResponse>();
      
       streamCcontroller.stream.listen((data){
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
      setListner();

    }

    @override
      void dispose() {
       streamCcontroller.close();
        super.dispose();
        print('StreamSinkTestPage-DISPOSE');
      }
  
  _goto_subsciptionPage(){
      setState(() {
      print('SUBSCRIPTION Button CLICKED');
      StreamListnerPage listnerPage = StreamListnerPage();
        Navigator.push(context,  new MaterialPageRoute<StreamListnerPage>(
          builder: (BuildContext context) => listnerPage

        ));
      });
   
 }
  
 void _streamTest_clicked(){
   print('Post Notification');

   //Post notification
   setState(() {
     // _incCounter = _incCounter+2;
     startTimer();

        _streamResponse = StreamResponse(
      code:'10001' +  _incCounter.toString(),
         desc: 'Test Notification' +  _incCounter.toString(),
         actBalance: 234.09 + _incCounter
   );
       streamCcontroller.add(_streamResponse);
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
          children: <Widget>[
          const SizedBox(height: 20.0),
          new Row(
            children: <Widget>[
 new Text('Code:  ' +_streamResponse.code),
            ],
            ),
             new Row(
            children: <Widget>[
 new Text('Description: ' +_streamResponse.desc),
            ],
            ),
             new Row(
            children: <Widget>[
 new Text('Balance: ' + _streamResponse.actBalance.toString()),
            ],
            ),

            new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _streamTest_clicked,
            child: Text('Start Timer'),
          ),
          ],

          ),
      ),
    
     
    );
  }

}


