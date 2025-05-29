import 'package:nms_app/firebase_api.dart';
import 'package:nms_app/network/network_binding.dart';
import 'package:nms_app/router.dart';
import 'package:nms_app/setup/setup_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'modules/controllers/login/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  NetworkBinding().dependencies();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FireBaseApi().initNotification();
  Get.put(LoginController());
  runApp(GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'), // Vietnamese
        // Add more locales if needed
      ],
       builder: (context, child) {
      final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
      double tile=data.size.shortestSide < 600 ? 1.1 : 1.2;
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: tile,boldText: false), // Khóa cỡ chữ toàn bộ
        child: child!,
      );
    },
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouters.INITIAL,
      getPages: PageRouters.routers,
      initialBinding: SetupBinding(),
      themeMode: ThemeMode.light,
      navigatorObservers: [GetObserver((_) {}, Get.routing)]));
}
