import 'package:flutter/material.dart';
import 'add_activities.dart';

class ActivityScreen extends StatefulWidget {
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  Widget build (BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddActivities()),
        );
      },
        child: const Text('Add Activity'),),
    );
  }
}