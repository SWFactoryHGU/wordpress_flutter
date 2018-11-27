import 'dart:async';

import 'package:wordpress_flutter/models/user_model.dart';
import 'package:wordpress_flutter/utils/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://wordpresscafe.dothome.co.kr/wp-json";
  static final LOGIN_URL = BASE_URL + "/jwt-auth/v1/token";

  Future<UserModel> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["code"] != null) throw Exception(res["code"]);
      return new UserModel.fromJson(res);
    });
  }
}