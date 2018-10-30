import 'package:flutter_test/flutter_test.dart';

import 'package:test_app/BLoC/user_info.dart';
import 'package:test_app/BLoC/user_info_service.dart';


void main() {
 List<UserInfoData> listResponse;
    UserInfoService service ;
    String inputData = "";

  setUp(() {
    service = UserInfoService();
      inputData = "1";
      listResponse = [];
     });
group("User Info list creation test", () {
    test('create User Info item', () {
        service.fetchData(inputData).then((result){
     listResponse = result;
      expect(listResponse.length,1);
      UserInfoData userInfo = listResponse[0];
       expect(userInfo, isNot(null));
   
    });
    });

    test('Get all records', () {
      inputData= "";
        service.fetchData(inputData).then((result){
     listResponse = result;
         final int records =0;
      expect(listResponse.length, isNot(records));
      UserInfoData userInfo = listResponse[0];
       expect(userInfo, isNot(null));
    });
    
    });
  });
}