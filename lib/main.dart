import 'package:flutter/material.dart';
import 'package:studysync/activityScreen.dart';
import 'package:studysync/schedule.dart';

void main() {
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

  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: 3,
     child: Scaffold(
       appBar: AppBar(
         title: const Text("StudySync"),
         centerTitle: true,
         bottom: const TabBar(tabs: [
           Tab(text: "Schedule",),
           Tab(text: "Activities",),
           Tab(text: "Study",)
         ]),
       ),

       body: TabBarView(children: [
         ScheduleScreen(),
         ActivityScreen(),
         Text("study part"),
       ]),
     ),
   );
  }
}

