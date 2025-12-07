import 'package:flutter/cupertino.dart';
import 'package:my_mvvm/app/utils.dart';
import 'package:my_mvvm/models/User.dart';
import 'package:my_mvvm/models/productsall.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  User? user;
  HomeViewModel(this.user);
  List<Data>? productslist = [];

  Future<void> getdata() async {
    setBusy(true);
    try {
      productslist = await apiservice.getproducts() ?? [];
      notifyListeners();
      setBusy(false);
    } catch (e) {
      debugPrint("login error:::${e.toString()}");
      setBusy(false);
    } finally {
      setBusy(false);
    }
  }
}
