import 'package:flutter/material.dart';

class ActivityDetails extends StatelessWidget {
  String title;
  String subject;
  String description;
  String deadlineDate;
  String deadlineTime;

  ActivityDetails({
    required this.title,
    required this.subject,
    required this.description,
    required this.deadlineDate,
    required this.deadlineTime,
    Key?  key
  }) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E213D),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E213D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),
            ),
            subtitle: Text(
              subject,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w100
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
            child: Text(
              'Description',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text(description),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 12),
            child: Text('Deadline',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),
            ),
          ),

          SizedBox(
            height: 100,
            child: Row(
              children: [

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: Text(deadlineDate,
                            style: TextStyle(
                            ),
                          ),
                        ),
                      )
                    )
                ),

                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.access_time),
                            title: Text(deadlineTime),
                          ),
                        )
                    )
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 65,
                        width: 135,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFFCC72C),
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                            )
                          ),
                          onPressed: () {

                          },
                          child: const Text('Edit Activity',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 65,
                        width: 135,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF4CB648),
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                            )
                          ),
                          onPressed: () {

                          },
                          child: const Text('Mark as Done',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}