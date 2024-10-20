import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:salo/src/professionals/home/home_screen_cubit.dart';
import 'package:salo/src/professionals/home/requests/requests_page.dart';
import 'package:salo/src/shared/resources.dart';

import '../../notifications_configs.dart';
import 'my_requests/my_requests_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _maybeRequestNotificationPermissions() {
    final messaging = FirebaseMessaging.instance;
    unawaited(messaging.requestPermission());

    messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    /// Show notification even if app is opened
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidNotificationChannel.id,
              androidNotificationChannel.name,
              channelDescription: androidNotificationChannel.description,
              icon: android.smallIcon,
              // other properties...
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeScreenCubit>().init();
    _maybeRequestNotificationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    final tabBarTextStyle = context.textTheme.titleSmall!.copyWith(
      color: primaryColor,
    );

    return DefaultTabController(
      length: 2,
      animationDuration: Duration.zero,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              appName,
              style: context.textTheme.displayLarge!.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: primaryColor,
              ),
            ),
          ),
          actions: [
            IconButton(
              highlightColor: Colors.transparent,
              onPressed: () => context.push('/home/profile'),
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black26,
                size: 36,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.black12,
            splashFactory: NoSplash.splashFactory,
            indicatorColor: accentColor,
            labelStyle: tabBarTextStyle.copyWith(fontWeight: FontWeight.w600),
            unselectedLabelStyle: tabBarTextStyle,
            tabs: [
              Tab(text: 'Disponíveis'.toUpperCase()),
              Tab(text: 'Meus Pedidos'.toUpperCase()),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            RequestsPage(),
            MyRequestsPage(),
          ],
        ),
      ),
    );
  }
}
