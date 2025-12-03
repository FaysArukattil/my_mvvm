import 'package:my_mvvm/constants/assets.gen.dart';
import 'package:my_mvvm/ui/screens/splash/splashviewmodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onDispose: (model) {},
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return SplashViewModel();
      },
      builder:
          (BuildContext context, SplashViewModel viewModel, Widget? child) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Assets.images.logo.image(
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ClipOval(
                    child: Assets.images.rahul.image(
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
    );
  }
}
