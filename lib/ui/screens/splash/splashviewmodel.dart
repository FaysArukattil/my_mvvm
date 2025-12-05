import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/app/utils.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  init() async {
    var user = await userservice.getUser() ?? null;
    // code to navigate to  next screen
    Future.delayed(Duration(seconds: 3), () {
      user == null
          ? navigationService.navigateTo(Routes.loginview)
          : navigationService.navigateTo(
              Routes.homeview,
              arguments: HomeviewArguments(user: user),
            );
    });
  }
}
