import 'package:flutter/material.dart';
import 'package:my_mvvm/models/User.dart';
import 'package:my_mvvm/ui/screens/home/homeviewmodel.dart';
import 'package:stacked/stacked.dart';

class Homeview extends StatelessWidget {
  User? user;
  Homeview({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () {
        return HomeViewModel(user);
      },
      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: Text("Hai ${viewModel.user!.name}")),
        );
      },
    );
  }
}
