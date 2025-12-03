import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_mvvm/ui/tools/screen_size.dart';
import 'package:my_mvvm/app/app.locator.dart';
import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/constants/app_strings.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      // ByteData data = await PlatformAssetBundle().load(
      //   Assets.ca.letsEncryptR3,
      // );
      // SecurityContext.defaultContext.setTrustedCertificatesBytes(
      //   data.buffer.asUint8List(),
      // );
    }
  }
  setupDependencies();
  runApp(const MyApp());
}

Future<void> setupDependencies() async {
  setupLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFBF1)),
      title: AppStrings.appName,
      builder: (context, child) {
        ScreenSize.init(context);
        FlutterSmartDialog.init();
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorObservers: [
        StackedService.routeObserver,
        FlutterSmartDialog.observer,
      ],
    );
  }
}
