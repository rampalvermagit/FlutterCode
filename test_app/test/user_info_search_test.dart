import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_app/BLoC/user_info_search.dart';
//import 'package:test_app/accounts_summary.dart';

void main() {
  testWidgets('Block Test Page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
  //  await tester.pumpWidget(new MyFirstApp());
 await tester.pumpWidget(new MaterialApp(home:  UserInfoSearchPage()));
//Verify Account Button
 final Finder fetchBtn = find.widgetWithText(RaisedButton, 'Fetch Data');
    expect(fetchBtn, findsOneWidget);
 
 // await tester.tap(fetchBtn);
  //await tester.pump();

  //  await tester.pump(const Duration(seconds: 2)); 


  });
}