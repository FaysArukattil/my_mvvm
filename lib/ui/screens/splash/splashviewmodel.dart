import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/app/utils.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  init() {
    // code to navigate to  next screen
    Future.delayed(Duration(seconds: 3), () {
      //navigationService.navigateTo(Routes.loginview);
      // navigationService.pushNamedAndRemoveUntil(Routes.loginview);
    });
  }
}
