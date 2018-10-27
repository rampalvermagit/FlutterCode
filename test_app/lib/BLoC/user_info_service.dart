import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './user_info.dart';


class UserInfoService {

static const String _url_all = 'https://jsonplaceholder.typicode.com/posts/';
final http.Client  _httpClient = http.Client();
 

Future<List<UserInfoData>> fetchData(String query) async {
    List<UserInfoData> list = [];
    String urlString = _url_all;

  print('QUERY::'+query);

    if(!query.isEmpty ){
       print('QUERY DATA::'+ query);
      urlString = _url_all + '?id=' +query;
     }
      print('URL::'+ urlString);
   
print('INSIDE FETCH');
    await _httpClient
      .get(Uri.parse(urlString))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json)
        .then((response) =>
            response.forEach((resp) => list.add(UserInfoData.fromJson(resp))));

    return list;
  }


}