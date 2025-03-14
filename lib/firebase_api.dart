import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class FireBaseApi {
  final _fireMessage = FirebaseMessaging.instance;
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final StreamController<ReceivedNotification>
      didReceiveLocalNotificationStream =
      StreamController<ReceivedNotification>.broadcast();
  bool isFlutterLocalNotificationsInitialized = false;

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'com.vnpt.phutho.ioffice', // id
      'channel ioffice phu tho', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true),
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description, icon: '@mipmap/logo_vnpt'
              //      one that already exists in example app.
              ),
        ),
      );
    }
  }

  _handleMessage(RemoteMessage? message) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? domainAPi = pref.getString("apiDomain");
    /*pref.getString(GetStorageKey.userName);
    String? isLogin = pref.getString(GetStorageKey.isLogin);
    if (message == null) return;
    var items = message.data['item'];
    try{
    Map<String, dynamic> jsonData = json.decode(items)[0]!;
    double maVanBanDiKc =
        // ignore: unnecessary_null_comparison
        jsonData != null ? jsonData['ma_van_ban_di_kc'] : null;
    var actionType = message.data['action_type'];
    if (isLogin == "1" && domainAPi != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
// Here you can write your code
        onSwitchScreen(maVanBanDiKc.toInt(), actionType);
      });
    }
    }
    catch(e){
      print(e);
    }*/
  }

  Future<void> initLocalNotification() async {
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        didReceiveLocalNotificationStream.add(
          ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      },
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: const AndroidInitializationSettings("@mipmap/logo_vnpt"),
            iOS: initializationSettingsDarwin);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {});
  }

  // chuyển màng hình
  void onSwitchScreen(int maVanBan, String actionType) {
    /*switch (actionType) {
      case 'VBDiChoDuyet':
        Get.toNamed(Routers.DETAILSVBDI, arguments: {
          "maVanBanDi": maVanBan,
          "indexTab": 0,
          "isLanhDao": 1,
          "maYeuCau": 2
        });
        break;
      default:
    }*/
  }

  initPushNotification() {
    _fireMessage.getInitialMessage().then(_handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    // FirebaseMessaging.onBackgroundMessage(_hanldBackgroundMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // ignore: avoid_print
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // ignore: avoid_print
      print("User granted provisional");
    } else {
      // ignore: avoid_print
      print("user declined or has not accepted permission");
    }
  }

  initNotification() async {
    requestPermission();
    await setupFlutterNotifications();
    initLocalNotification();
    initPushNotification();
  }
}
