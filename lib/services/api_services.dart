import 'dart:convert';
import 'package:my_mvvm/app/utils.dart';
import 'package:my_mvvm/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_mvvm/models/productsall.dart';

class ApiService {
  final baseurl = "https://freeapi.luminartechnohub.com";
  Future<User?> login({required String email, required String password}) async {
    Uri url = Uri.parse("$baseurl/login");
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({"email": email, "password": password});
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
      debugPrint(e.toString());
      //SmartDialog.dismiss();
    }
    return null;
  }

  Future<List<Data>?> getproducts() async {
    Uri url = Uri.parse("$baseurl/products-all/");
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${await userservice.getAccessToken()}",
    };
    try {
      final response = await http.get(url, headers: headers);
      debugPrint("response:::${response.body}");
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var all = Productsall.fromJson(json);
        return all.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
