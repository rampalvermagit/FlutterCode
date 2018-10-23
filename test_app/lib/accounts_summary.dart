import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

import './account_details.dart';

//Accounts Data Model
class AccountData {

final String accountNumber;
  final String accountName;
  final String accountType;
  final double accountBalance;

   AccountData({
   @required this.accountNumber,
   @required this.accountName,
   @required this.accountType,
   @required this.accountBalance,
 });
  
  //Map the data to Account Object
 factory AccountData.fromJson(Map<String, dynamic> json){
   return AccountData(
     accountNumber: json['accountNumber'],
     accountName: json['accountName'],
     accountType: json['accountType'],
     accountBalance: json['accountBalance']
   );
 }

}
//Load Accounts Data from Local
Future<List<AccountData>> _fetchAccountsInfo() async {
  final response = await rootBundle.loadString('assets/accounts.json');

//Isolate - run in secondary thread as this may take time 
 return compute(_parseResponse, response);
   
}

List<AccountData> _parseResponse(String responseBody){
final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<AccountData>((json) => AccountData.fromJson(json)).toList();
}

//Build Page
class AccountsSummaryPage extends StatelessWidget {
  final String title;

  AccountsSummaryPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body:FutureBuilder<List<AccountData>>(
        future: _fetchAccountsInfo(),
         builder: (context, data) {
          if (data.hasError) print(data.error);

          return data.hasData ? _AccountList(accounts: data.data):
          Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  
}
class _AccountList extends StatelessWidget {
  final List<AccountData> accounts;

  _AccountList(
    {Key key, this.accounts}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
          padding:EdgeInsets.symmetric(vertical: 8.0),
          itemCount: accounts.length,
          itemBuilder: (BuildContext context, int index){
             final String actNumber = accounts[index].accountNumber;
            final String actDesc = accounts[index].accountName + " -(" + accounts[index].accountBalance.toString() + ")";
            final String actType = accounts[index].accountType;
            return new ListTile(
              isThreeLine: true,
              leading:new CircleAvatar(child: new Text(actType)),
              title: new Text(actNumber),
              subtitle: new Text(actDesc),
               onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountDetailsPage(title: 'Account Details', account: accounts[index]),
          ),
        );
      },
            );
            
          },

        ),
      );
  }

}