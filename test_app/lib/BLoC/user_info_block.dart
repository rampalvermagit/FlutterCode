import 'dart:async';

import 'package:flutter/material.dart';

import './user_info.dart';
import './user_info_service.dart';


class UserInfoBlock {
  final UserInfoService service = UserInfoService();

 
//sink Controller
  final _outStreamController = StreamController.broadcast<List<UserInfoData>>();

Stream<List<UserInfoData>> get outStream => _outStreamController.stream;

  final _inStreamController = StreamController<String>();

  Sink<String> get searchInfo => _inStreamController.sink;
  Stream<String> get result => _inStreamController.stream;

  UserInfoBlock(){
    //In Constructor add listner method
    result.listen(onDataChange);

  }

//onDataChange method willbe called from listner 
  void onDataChange(String inputData){
   //Prepare Object
   print('ONCHANGED FIRED' + inputData);
   List<UserInfoData> list = [];
   
   service.fetchData(inputData).then((result){
     print('DATA RETURNED');
     list = result;
     _outStreamController.add(list);
   });
   
  }
  void dispose(){
    _inStreamController.close();
    _outStreamController.close();
  }

}