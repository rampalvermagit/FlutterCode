import 'package:flutter/material.dart';


class Accounts {
  const Accounts({
   @required this.accountNumber,
   @required this.accountName,
   @required this.accountType,
   @required this.accountBalance,
 });
  final String accountNumber;
  final String accountName;
  final String accountType;
  final double accountBalance;
 

}

class AccountsPage extends StatefulWidget {
const AccountsPage({ Key key ,this.title}) : super(key: key);
final String title;
  @override
    _AccountsPagePageState createState() => new _AccountsPagePageState();

}

class _AccountsPagePageState extends State<AccountsPage> {

   final List<Accounts> _actList = <Accounts>[
    new Accounts(
      accountNumber: '00000234567771234',
      accountName: 'Checking Account',
      accountType: 'CHK',
      accountBalance:1423.00
    ),
     new Accounts(
      accountNumber: '0000023456789',
      accountName: 'Checking Account',
      accountType: 'CHK',
      accountBalance:52423.00
    ),
     new Accounts(
      accountNumber: '99990000000234',
      accountName: 'Checking Account',
      accountType: 'CHK',
      accountBalance:99999.99
    ),
     new Accounts(
      accountNumber: '234567777775555',
      accountName: 'Saving Account',
      accountType: 'SAV',
      accountBalance:72423.00
    ),
     new Accounts(
      accountNumber: '400040040004000',
      accountName: 'Saving Account',
      accountType: 'SAV',
      accountBalance:82423.00
    ),
     new Accounts(
      accountNumber: '888888888881999',
      accountName: 'Investment Account',
      accountType: 'INV',
      accountBalance:230009.99
    ),
     new Accounts(
      accountNumber: '1234123412341234',
      accountName: 'Checking Account',
      accountType: 'CHK',
      accountBalance:991423.00
    ),
     new Accounts(
      accountNumber: '40000200005000',
      accountName: 'Checking Account',
      accountType: 'CHK',
      accountBalance:52423.00
    ),
     new Accounts(
      accountNumber: '23456781114560',
      accountName: 'Loan Account',
      accountType: 'LOV',
      accountBalance:23000000.00
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Account List'),
      ),
      body: new Container(
        child: new ListView.builder(
          padding:EdgeInsets.symmetric(vertical: 8.0),
          itemCount: _actList.length,
          itemBuilder: (BuildContext context, int index){
            final String actNumber = _actList[index].accountNumber;
            final String actDesc = _actList[index].accountName + " -(" + _actList[index].accountBalance.toString() + ")";
            final String actType = _actList[index].accountType;
            return new ListTile(
              isThreeLine: true,
              leading:new CircleAvatar(child: new Text(actType)),
              title: new Text(actNumber),
              subtitle: new Text(actDesc),
   
            );
            
          },

        ),
      ),
    );
  }

 
}