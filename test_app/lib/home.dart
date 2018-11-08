
import 'package:flutter/material.dart';


import 'package:test_app/transfer.dart';
import 'package:test_app/accounts_summary.dart';
import 'package:test_app/take_photo.dart';
import 'package:test_app/stream_sink_test.dart';
import 'package:test_app/rest_service.dart';
import 'package:test_app/BLoC/user_info_search.dart';
import 'package:test_app/RXDart/rxdart_test.dart';

import 'package:test_app/common/session_manager_provider.dart';
import 'package:test_app/common/session_manager_data.dart';



class MyFirstApp extends StatelessWidget {
 SessionManagerData sessionData = SessionManagerData();

 @override
   Widget build(BuildContext context) {
     return SessionManagerProvider(
        sessionData:sessionData,
        child:MaterialApp(
       theme:ThemeData(
         primarySwatch:Colors.deepOrange,
         accentColor: Colors.deepPurple
       ),
       home: new HomePage(title: 'TEST APP'),
     )
     );
   }
  
}

class HomePage extends StatefulWidget {
 
  final String title;
   

   HomePage({Key key, this.title}):super(key:key);

  @override
    _HomePageState createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage> {
SessionManagerData sessionData;
  @override
    Widget build(BuildContext context) {
      final ThemeData theme = Theme.of(context);
       sessionData = SessionManagerProvider.of(context);
      return Scaffold(
        appBar:  AppBar(
          title:  Text(widget.title),
        ),
        body:  Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child:  Column(
            children:<Widget>[
              new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _getSession,
            child: Text('Get Uswer Session'),
          ),
              new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _accountSummary_clicked,
            child: Text('Accounts'),
          ),
            new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _transfer_clicked,
            
            child: Text('Transfer'),
       
          ),  new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _serviceTest_clicked,
            child: Text('Service Test'),
          ),
            
           new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _stream_sink_clicked,
            child: Text('Stream/Sink With Timer'),
          ), 
           new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _block_test_clicked,
            child: Text('Stream/Sink With BLoC'),
          ), 
   new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _block_test_withdart_clicked,
            child: Text('BLOCK using RXDart'),
          ),
           new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _user_registration_clicked,
            child: Text('MVVM Approach'),
          ), 
            ],
          ),
          
        ),
      
      );
        
    }
    //Button clicked methods
    void _getSession(){
      print('Get Session ');
     var  sessionData = SessionManagerProvider.of(context);

        sessionData.sessionId = 'ABCDEFH12345546565656565ABCDS';
        sessionData.userName = 'RAM PAL VVERMA';
         print('Received User Session ');
    }
void _stream_sink_clicked(){
   setState(() {
        print('Stream Sink CLICKED');
        Navigator.push(context,  new MaterialPageRoute<StreamSinkTestPage>(
          builder: (BuildContext context) => new StreamSinkTestPage()

        ));

      });
 }
 void _user_registration_clicked(){
   setState(() {
        print('EMAIl VALIDATION CLICKED');
      /* Navigator.push(context,  new MaterialPageRoute<InputFieldTestPageWithStreamSink>(
          builder: (BuildContext context) => new InputFieldTestPageWithStreamSink()

        ));
        */

      });
 }
 void _transfer_clicked(){
   setState(() {
        print('Transfer CLICKED');
        Navigator.push(context,  new MaterialPageRoute<TransferPage>(
          builder: (BuildContext context) => new TransferPage()

        ));

      });
 }
 void _accountSummary_clicked(){
   setState(() {
        Navigator.push(context,  new MaterialPageRoute<AccountsSummaryPage>(
          builder: (BuildContext context) => new AccountsSummaryPage(title:'Accounts Summary Page')

        ));

      });
 }
 
 void _takePhoto_clicked(){
    setState(() {
        print('Camera VIEW CLICKED');
       Navigator.push(context,  new MaterialPageRoute<TakePhotoPage>(
        builder: (BuildContext context) => new TakePhotoPage()

       ));

      });
 }
 void _serviceTest_clicked(){
    setState(() {
        print('Camera VIEW CLICKED');
       Navigator.push(context,  new MaterialPageRoute<RestServiceTestPage>(
        builder: (BuildContext context) => new RestServiceTestPage(title: 'Service Test')

       ));

      });
 }
 void _block_test_clicked(){
    setState(() {
        print('BLOCK  CLICKED');
       Navigator.push(context,  new MaterialPageRoute<UserInfoSearchPage>(
        builder: (BuildContext context) => new UserInfoSearchPage()

       ));

      });
 }
 void _block_test_withdart_clicked() {
   setState(() {
        print('BLOCK  with RXDart CLICKED');
       Navigator.push(context,  new MaterialPageRoute<RXDartTestPage>(
        builder: (BuildContext context) => new RXDartTestPage()

       ));

      });
 }
}