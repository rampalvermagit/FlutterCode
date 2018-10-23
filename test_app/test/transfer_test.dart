import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_app/transfer.dart';


void main(){
  
  testWidgets('Transfer Page smoke test', (WidgetTester tester) async {
  
    await tester.pumpWidget(new MaterialApp(home:  TransferPage()));


//Verify From Account
 //final Finder fromAccountDropdown = find.widgetWithText(DropdownButton, 'From Account');
 //  expect(fromAccountDropdown, findsOneWidget);

    //Verify Transfer Button
 //final Finder toAccount = find.widgetWithText(DropdownButton, 'To Account');
  //  expect(toAccount, findsOneWidget);

   //Verify Amount 
 final Finder amountText = find.widgetWithText(TextField, 'Amount');
    expect(amountText, findsOneWidget);

final Finder submitButton = find.widgetWithText(RaisedButton, 'TRANSFER');
    expect(submitButton, findsOneWidget);

    await tester.enterText(amountText, '');
    await tester.pumpAndSettle();
     await tester.drag(amountText, const Offset(0.0, -1200.0));
   await tester.pumpAndSettle();



 await tester.tap(submitButton);
    await tester.pumpAndSettle();
    expect(find.text('Amount iss required'), findsNothing);
   //expect(find.text('Please enter only Numeric characters.'), findsOneWidget);
  
  //Verify Date 
 //final Finder dateField = find.widgetWithText(_DateTimePicker, 'Transfer Date');
  //  expect(dateField, findsOneWidget);

    //Verify Date 
 /*final Finder submitButton = find.widgetWithText(RaisedButton, 'TRANSFER');
    expect(submitButton, findsOneWidget);

     await tester.enterText(amountText, '');
    await tester.pumpAndSettle();
     await tester.drag(amountText, const Offset(0.0, -1200.0));
    await tester.pumpAndSettle();
    */

  });
}
