import 'dart:convert';
import 'package:my_mvvm/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseurl = "https://freeapi.luminartechnohub.com";
  Future<User?> login({required String email, required String password}) async {
    Uri url = Uri.parse("$baseurl/login");
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({"email": "$email", "password": "$password"});
    try {
      // SmartDialog.showLoading();
      final response = await http.post(url, headers: headers, body: body);

      debugPrint("response:::${response.body}");
      //SmartDialog.dismiss();
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var json = jsonDecode(response.body);
        var user = User.fromJson(json);
        return user;
      }
    } catch (e) {
      print(e.toString());
      //SmartDialog.dismiss();
    }
  }
}
