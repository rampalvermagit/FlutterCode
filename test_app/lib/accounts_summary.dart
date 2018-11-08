
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:test_app/account_details.dart';

import 'package:test_app/common/session_manager_bloc.dart';
import 'package:test_app/common/session_manager_provider.dart';
import 'package:test_app/common/session_manager_data.dart';

import 'package:test_app/account_data.dart';
import 'package:test_app/account_service.dart';

class AccountsSummaryPage extends StatelessWidget {
  final String title;
   SessionManagerBloc bloc ;
   final AccountService actService = AccountService();
   var sessionData = SessionManagerData();
   

   AccountsSummaryPage( { this.title});
    
 
  void getSessionInfo(BuildContext context){
    final sessionProvider = (context.inheritFromWidgetOfExactType(SessionManagerProvider)) as SessionManagerProvider;
        print(sessionProvider.sessionData.userName);
       print('SESSION ID::::' + sessionProvider.sessionData.sessionId);
 
    /*final  bloc = SessionManagerProvider.of(context);
    Future<SessionManagerData> item =  bloc.sessionInfo.first;
    item.then((data){
      print(data.userName);
      print('SESSION ID::::' + sessionProvider.sessionData.sessionId);
    });
    */
  }

  @override
  Widget build(BuildContext context) {
   getSessionInfo(context);
     return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body:FutureBuilder<List<AccountData>>(
        future: actService.fetchAccountsInfo(),
         builder: (context, data) {
          if (data.hasError) print(data.error);
            if (data.hasData){
              final sessionProvider = (context.inheritFromWidgetOfExactType(SessionManagerProvider)) as SessionManagerProvider;
                  sessionProvider.sessionData.actList = data.data;
                  print('HAS Account Data');
            }
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