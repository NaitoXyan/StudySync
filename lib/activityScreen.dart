import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studysync/activityDetails.dart';
import 'addActivityScreen.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

// uses the SingleTickerProvider Mixin
class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {

  DateTime currentTime = DateTime.now();
  Timer? timer;
  List<Map<String, String>> activitiesList = [];

  // defining the Animation Controller
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  // defining the Offset of the animation
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    )
  );

  //make animation perform once and stop
  void repeatOnce() async {
    await _animationController.forward();
  }

  @override
  void initState() {
    repeatOnce();
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  //change color depende sa deadline
  deadline(index) {
    String? stringDate = activitiesList[index]['date'];
    String? stringTime = activitiesList[index]['time'];

    //combine the two
    String stringDateTime = '$stringDate $stringTime';

    //covert from String to DateTime
    DateTime deadlineDateTime = DateFormat('d MMMM y HH:mm a').parse(stringDateTime);

    final differenceDates = DateTime.now().difference(deadlineDateTime).inSeconds;

    //wala pa deadline
    if (differenceDates < 0 && differenceDates < -86400) {
      return 0xFFFFEDB8;
    }

    //under 24 hours na deadline
    else if(differenceDates < 0 && differenceDates >= -86400) {
      return 0xFFFFAE63;
    }

    //lapas na deadline
    else if (differenceDates >= 0) {
      return 0xFFFF6258;
    }
  }

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: SlideTransition(
            // the offset which we define above
            position: _offsetAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFF7DE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ]
              ),

              child: ListView.builder(
                itemCount: activitiesList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(deadline(index)),
                    child: ListTile(
                      title: Text(activitiesList[index]['title'] ?? 'No Subject'),
                      subtitle: Text(activitiesList[index]['subject'] ?? 'No Title'),
                      trailing: Text(
                        //splits it into two lines = \n
                        '${activitiesList[index]['date'] ?? 'No Date'} \n${activitiesList[index]['time'] ?? 'No Time'}'
                      ),

                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ActivityDetails(
                          title: activitiesList[index]['title'] ?? 'null',
                          subject: activitiesList[index]['subject']  ?? 'null',
                          description: activitiesList[index]['description']  ?? 'null',
                          deadlineDate: activitiesList[index]['date']  ?? 'null',
                          deadlineTime: activitiesList[index]['time']  ?? 'null',
                        ))
                      ),
                    ),
                  );
                },
              )

            ),
          )
        ),

        Expanded(
          flex: 3,
          child: Center(
            child: SizedBox(
              width: 330,
              height: 90,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddActivities())
                  );

                  setState(() {
                    activitiesList.add(result);
                  });

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff000000),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),

                child: const Text('Add Activity',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}