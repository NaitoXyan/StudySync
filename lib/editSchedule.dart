import 'package:flutter/material.dart';

class EditSchedule extends StatefulWidget {
  const EditSchedule({super.key});

  @override
  State<EditSchedule> createState() => _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}