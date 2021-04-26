import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Api._privateConstructor();
  // final String _url = "https://lendit-gateway-homolog.herokuapp.com";
  final String _url = "http://10.0.2.2:3000";
  static final Api _instance = Api._privateConstructor();
  static final headers = {"content-type": 'application/json'};

  factory Api() {
    return _instance;
  }

  Future<String> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.getString('token');
  }

  Future<http.Response> get({@required String route}) async {
    String token = await getToken();
    var response = await http.get(_url + route, headers: {
      ...headers,
      "authorization": token,
    });

    if (response.statusCode != 200) {
      throw response;
    }

    return response;
  }

  Future<http.Response> post({
    @required String route,
    @required dynamic body,
    dynamic header,
  }) async {
    String token = await getToken();

    if (header != null) {
      return http.post(_url + route, body: jsonEncode(body), headers: {
        ...headers,
        "authorization": token,
        ...header,
      });
    }
    return http.post(_url + route, body: jsonEncode(body), headers: {
      ...headers,
      "authorization": token,
    });
  }

  Future<http.Response> patch({
    @required String route,
    @required dynamic body,
  }) async {
    String token = await getToken();

    return http.patch(_url + route, body: jsonEncode(body), headers: {
      ...headers,
      "authorization": token,
    });
  }

  Future<http.Response> put({
    @required String route,
    @required dynamic body,
  }) async {
    String token = await getToken();

    return http.put(_url + route, body: jsonEncode(body), headers: {
      ...headers,
      "authorization": token,
    });
  }

  Future<http.Response> delete({@required String route}) async {
    String token = await getToken();

    return http.delete(_url + route, headers: {
      ...headers,
      "authorization": token,
    });
  }
}
