import 'package:flutter/material.dart';
import 'package:my_mvvm/ui/tools/blur_background.dart';
import 'package:my_mvvm/ui/tools/screen_size.dart';
import 'package:stacked/stacked.dart';

import 'loginviewmodel.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginviewModel>.reactive(
      onDispose: (model) {},
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return LoginviewModel();
      },
      builder: (BuildContext context, LoginviewModel viewModel, Widget? child) {
        return Scaffold(
          body: Stack(
            children: [
              loginform(context, viewModel),
              if (viewModel.isBusy)
                Positioned.fill(
                  child: BlurBackground(
                    blur: 8,
                    child: Container(
                      color: Color(0x33000000),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget loginform(BuildContext context, LoginviewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSize.height,
          child: Form(
            key: viewModel.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 50),
                TextFormField(
                  validator: (v) => viewModel.validateEmail(),
                  controller: viewModel.usernamectlr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                    labelText: "email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (v) {
                    return v!.length == 0 ? "must fill password" : null;
                  },
                  obscureText: true,
                  controller: viewModel.password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password"),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: ScreenSize.width,
                  height: ScreenSize.buttonheight,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Alredy have account? "),
                    TextButton(onPressed: () {}, child: Text("SignUp")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
