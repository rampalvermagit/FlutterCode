import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:test_app/account_data.dart';

class AccountService{

//Load Accounts Data from JSON
Future<List<AccountData>> fetchAccountsInfo() async {
  print('***********LOAD JSON CALLED***********');

  final response = await rootBundle.loadString('assets/accounts.json');
  final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed.map<AccountData>((json) => AccountData.fromJson(json)).toList();
    
 //  return compute(_parseResponse, response);
   
}

List<AccountData> _parseResponse(String responseBody){
final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<AccountData>((json) => AccountData.fromJson(json)).toList();
}
}

