import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/app/utils.dart';
import 'package:my_mvvm/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class LoginviewModel extends BaseViewModel {
  TextEditingController usernamectlr = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  User? user;
  String? validateEmail() {
    var value = usernamectlr.text;
    if (value.isEmpty) {
      return 'Email is required';
    }

    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null; // valid email
  }

  void init() {
    // code to navigate to  next screen
  }
  Future<bool?> login() async {
    if (!formkey.currentState!.validate()) {
      return false;
    } else {
      setBusy(true);
      try {
        user = await apiservice.login(
          email: usernamectlr.text.trim(),
          password: password.text.trim(),
        );
      } catch (e) {
        debugPrint("login error:::${e.toString()}");
      } finally {
        setBusy(false);
      }

      if (user != null) {
        await userservice.saveUser(user!);
        navigationService.navigateTo(
          Routes.homeview,
          arguments: HomeviewArguments(user: user!),
        );
        return true;
      }
      false;
    }
    return null;
  }
}
