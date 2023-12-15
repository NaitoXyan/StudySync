import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  var date = DateTime.now();

  Widget build (BuildContext context) {
    return Column(
      children: [
        scheduleDay(),
        Expanded(child: scheduleList(),)
      ],
    );
  }

  Widget scheduleDay() {
    return Container(
      height: 50,
      color: Colors.limeAccent,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: Text(DateFormat('EEEE').format(date)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget scheduleList() {
    return ListView(
      children: const [
        ListTile(
          title: Text('data'),
        )
      ],
    );
  }
}