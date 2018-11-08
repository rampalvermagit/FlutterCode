
import 'package:flutter/material.dart';

import 'package:test_app/common/session_manager_provider.dart';
import 'package:test_app/account_data.dart';

class AccountDetailsPage extends StatelessWidget {

const AccountDetailsPage( {Key key, this.title, this.account}):super(key:key);

  final String title;
  final AccountData account;

 void getSessionInfo(BuildContext context){
     final sessionProvider = (context.inheritFromWidgetOfExactType(SessionManagerProvider)) as SessionManagerProvider;
        print(sessionProvider.sessionData.userName);
       print('SESSION ID::::' + sessionProvider.sessionData.sessionId);
 
  }
//
List<Widget>  _buildItems(){
  return <Widget>[
  _buildAccountView(
    <Widget>[
      const Text('Account Number'),
      new Text(
        account.accountNumber,
      style: const TextStyle(
        color: Colors.grey
      ),
        ),
      
    ],
  ),
  _buildAccountView(
    <Widget>[
      const Text('Account Name'),
      new Text(
        account.accountName,
      style: const TextStyle(
        color: Colors.grey
      ),
        ),
      
    ],
  ),
  _buildAccountView(
    <Widget>[
      const Text('Account Type'),
      new Text(
        account.accountType,
      style: const TextStyle(
        color: Colors.grey
      ),
        ),
      
    ],
  ),
  _buildAccountView(
    <Widget>[
      const Text('Balance'),
      new Text(
        account.accountBalance.toString(),
      style: const TextStyle(
        color: Colors.grey
      ),
        ),
      
    ],
  ),
  
  
];
}
//
Widget _buildAccountView(List<Widget> children) {
    return new Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 44.0,
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new DefaultTextStyle(
            style: const TextStyle(
              letterSpacing: -0.24,
              fontSize: 17.0,
              color: Colors.black,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      getSessionInfo(context);

      print('AccountDetailsPage');
      print(account.accountName);

      final ThemeData theme = Theme.of(context);

      return new Scaffold(
        appBar: new AppBar(
          title: const Text('Account Details'),

        ),
        body: new DefaultTextStyle(
          style: const TextStyle(
            fontSize:15.0,
            color: Colors.black,
          ),
          child: new DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
          child: new ListView(
            children: _buildItems(),
          ),
          ),
         
          
        ),
      );
    }

}