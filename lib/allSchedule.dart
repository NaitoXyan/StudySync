import 'package:flutter/material.dart';
import 'package:studysync/editSchedule.dart';

import 'allList.dart';

class AllSchedules extends StatefulWidget {
  const AllSchedules({super.key});

  @override
  State<AllSchedules> createState() => _AllSchedulesState();
}

class _AllSchedulesState extends State<AllSchedules> {

  bool buttonColor = false;

  editButtonColor() {
    if (!buttonColor) {
      return 0x80FFF7DE;
    }
    else {
      return 0xFFFFF7DE;
    }
  }

  removeButtonColor() {
    if (!buttonColor) {
      return 0x80FFF7DE;
    }
    else {
      return 0xFFFF7676;
    }
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E213D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E213D),
        title: const Text('Schedules',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // select button
          const Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 15, right: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('all schedules',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),

          // list of scheds
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: ListView.builder(
                  itemCount: scheduleList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(scheduleList[index]['subject_id'] ?? 'No Subject'),
                        trailing: Text(
                          //splits it into two lines = \n
                            '${scheduleList[index]['time_in'] ?? 'No TimeIn'} - ${scheduleList[index]['time_out'] ?? 'No TimeOut'}'
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditSchedule())
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // finish edit button
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                      child: const Text('Finish Edit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}