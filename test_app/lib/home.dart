
import 'package:flutter/material.dart';


import './transfer.dart';
import './service_test.dart';
import './accounts_summary.dart';
import './take_photo.dart';
import './stream_controller.dart';
import './user_registration.dart';



class MyFirstApp extends StatelessWidget {
 
 @override
   Widget build(BuildContext context) {
     
     return new MaterialApp(
       theme:ThemeData(
         primarySwatch:Colors.deepOrange,
         accentColor: Colors.deepPurple
       ),
       home: new HomePage(title: 'TEST APP'),
     );
   }
  
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}):super(key:key);
  final String title;

  @override
    _HomePageState createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage> {

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
        print('User Registraion CLICKED');
      /*  Navigator.push(context,  new MaterialPageRoute<UserRegistrationPage>(
          builder: (BuildContext context) => new UserRegistrationPage()

        ));*/

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
        print('Account Summary VIEW CLICKED');
        Navigator.push(context,  new MaterialPageRoute<AccountsSummaryPage>(
          builder: (BuildContext context) => new AccountsSummaryPage(title: 'Accounts Summary Page')

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
       Navigator.push(context,  new MaterialPageRoute<ServiceTestPage>(
        builder: (BuildContext context) => new ServiceTestPage(title: 'Service Test')

       ));

      });
 }
 
  @override
    Widget build(BuildContext context) {
      final ThemeData theme = Theme.of(context);

      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: new Column(
            children:<Widget>[
           
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
            
            onPressed: _takePhoto_clicked,
            child: Text('Take Photo'),
          ), 
           new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _stream_sink_clicked,
            child: Text('Stream/Sink'),
          ), 
           new RaisedButton(
            splashColor:theme.primaryColor.withOpacity(0.12),
            
            onPressed: _user_registration_clicked,
            child: Text('User Registration'),
          ), 
            ],
          ),
          
        ),
      );
    }
}