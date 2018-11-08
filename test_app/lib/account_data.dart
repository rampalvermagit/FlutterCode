
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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