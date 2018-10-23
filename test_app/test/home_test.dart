import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_app/home.dart';
//import 'package:test_app/accounts_summary.dart';

void main() {
  testWidgets('Home Page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
  //  await tester.pumpWidget(new MyFirstApp());
 await tester.pumpWidget(new MaterialApp(home:  MyFirstApp()));
//Verify Account Button
 final Finder accountButton = find.widgetWithText(RaisedButton, 'Accounts');
    expect(accountButton, findsOneWidget);
 

    //Verify Transfer Button
 final Finder transferButton = find.widgetWithText(RaisedButton, 'Transfer');
    expect(transferButton, findsOneWidget);
 

   //Verify Service Test Button
 final Finder serviceTestButton = find.widgetWithText(RaisedButton, 'Service Test');
    expect(serviceTestButton, findsOneWidget);

 
  
  await tester.tap(transferButton);
  
   await tester.tap(serviceTestButton);
   await tester.tap(accountButton);
  // await tester.pump(); 
  
  //   await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2)); 

//await tester.tap(transferButton);
// await tester.pumpAndSettle();

 // await tester.tap(serviceTestButton);
 //await tester.pumpAndSettle();
 

  });
}