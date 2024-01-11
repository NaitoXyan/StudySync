import 'package:flutter/material.dart';
import 'package:studysync/activityScreen.dart';
import 'package:studysync/schedule.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:studysync/studyTimer.dart';

void main() {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Test',
        )
      ],
      debug: true
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TabBar get _tabBar => const TabBar(
      labelColor: Colors.amber,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.amber,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(text: 'Schedule'),
        Tab(text: 'Activities'),
        Tab(text: 'Study')
      ]
  );

  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: 3,
     child: Scaffold(
       appBar: AppBar(
         backgroundColor: const Color(0xFF1E213D),
         title: const Text(
           "StudySync",
           style: TextStyle(
             fontWeight: FontWeight.w700,
             color: Colors.white
           ),
         ),
         centerTitle: true,
         bottom: PreferredSize(
           preferredSize: _tabBar.preferredSize,
           child: Material(
             color: const Color(0xFF212761),
             child: _tabBar,
           ),
         )
       ),

       body: const TabBarView(children: [
         ScheduleScreen(),
         ActivityScreen(),
         StudyTimerScreen(),
       ]),
     ),
   );
  }
}

