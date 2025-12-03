import 'package:my_mvvm/services/api_services.dart';
import 'package:my_mvvm/services/db_service.dart';
import 'package:my_mvvm/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

NavigationService get navigationService => locator<NavigationService>();
ApiService get apiservice => locator<ApiService>();
DbService get dbservice => locator<DbService>();
UserService get userservice => locator<UserService>();
