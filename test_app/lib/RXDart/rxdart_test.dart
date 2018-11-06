import 'package:flutter/material.dart';

import 'package:test_app/BLoC/user_info.dart';
import 'package:test_app/RXDart/rxdart_block.dart';
import 'package:test_app/RXDart/provider_info.dart';




class RXDartTestPage  extends StatelessWidget {
  
  @override
    Widget build(BuildContext context) {
      return TestServiceProvider(
        userInfoBlock: TestBloc(),
        child:_RXDartTestPage(),
      );
    }

}
class _RXDartTestPage extends StatelessWidget {

 List<UserInfoData> initialValue = [];
  String _inputText ="";

  @override
  Widget build(BuildContext context) {
    final userInfoBlock = TestServiceProvider.of(context);
    return Scaffold(
            appBar: AppBar(
              title:Text('BLoC with ReplaySubject'),
            ),
            body:Column(
              children:<Widget>[
                Container(
                  padding:EdgeInsets.all(10.0),
                  child:TextField(
                    onChanged: (text) {
                 _inputText = text;
                
                   },
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      hintText:'Enter 1, 2, 3 etc and for all just hit button',
                    ),
                  ),
                ),
                  new RaisedButton(
            
            onPressed:() {
              print("text field: $_inputText");
              userInfoBlock.queryInfo.add(_inputText);
              print('onPressed CLICKED');
             
            },
            child: Text('Fetch Data'),
          ), 
               StreamBuilder(
            stream: userInfoBlock.reqInfo,
            builder: (context, snapshot) => Container(
                  child: Text(snapshot?.data ?? ''),
                ),
          ),
               Flexible(
                  child: StreamBuilder<List<UserInfoData>>(
                    stream: userInfoBlock.response,
                    initialData: initialValue,
                    builder:(context,AsyncSnapshot<List<UserInfoData>> snapshot){
                      if (!snapshot.hasData)
                       return Center(
                         child:CircularProgressIndicator(),
                       );

                       return ListView.builder(
                         itemCount: snapshot.data.length,
                         itemBuilder: (context,index) => ListTile(
                           title: Text(snapshot.data[index].title),
                           subtitle: Text(snapshot.data[index].msgBody),
                         ),
                       );
                    },
                  ),
                ),
              ],
            ),
        
      );
  }

}

