import 'package:nms_app/network/network_binding.dart';
import 'package:nms_app/router.dart';
import 'package:nms_app/setup/setup_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  NetworkBinding().dependencies();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
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
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouters.Firstpage,
      getPages: PageRouters.routers,
      initialBinding: SetupBinding(),
      themeMode: ThemeMode.light,
      navigatorObservers: [GetObserver((_) {}, Get.routing)]));
}
