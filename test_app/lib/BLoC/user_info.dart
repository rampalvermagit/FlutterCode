import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfoData {
  final int userId;
  final String title;
  final String msgBody;

UserInfoData(this.title, this.msgBody, this.userId);

 UserInfoData.fromJson(Map json)
      : title = json['title'],
        msgBody = json["body"],
        userId = json["id"];

}