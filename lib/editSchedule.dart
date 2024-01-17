import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studysync/subjects.dart';
import 'package:studysync/allList.dart';

class EditSchedule extends StatelessWidget {
  const EditSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xff1E213D),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E213D),
          title: const Text('Edit Schedule',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        //SingleChildScrollView para dili mag pixel OVERFLOW
        body: const SingleChildScrollView(
          reverse: true,
          child: ChangeSchedule(),
        ),
      ),
    );
  }

}

class ChangeSchedule extends StatefulWidget {
  const ChangeSchedule({super.key});

  @override
  State<ChangeSchedule> createState() => _ChangeScheduleState();
}

class _ChangeScheduleState extends State<ChangeSchedule> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _timeInController = TextEditingController();
  final TextEditingController _timeOutController = TextEditingController();
  String dropdownValue = days.first;

  @override
  void dispose() {
    _subjectController.dispose();
    _dayController.dispose();
    _timeInController.dispose();
    _timeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //subject text label
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Text('Subject',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),

          //subject button ni siya
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _subjectController,
              readOnly: true,
              onTap: () async {
                _subjectController.text = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Subjects()),
                );
              },
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'SUBJECT',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      ),
                      borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white
                      )
                  )
              ),
            ),
          ),

          //day dropdown-button
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Day',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),

          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                  ),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          _dayController.text = dropdownValue;
                        });
                      },
                      items: days.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Text('Time',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),
            ),
          ),

          //boxes para sa time
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        readOnly: true,
                        onTap: selectTimeIn,
                        controller: _timeInController,
                        decoration: const InputDecoration(
                          hintText: 'Time in',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              )
                          ),
                        ),
                      ),
                    )
                ),

                Expanded(
                  child:  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      readOnly: true,
                      onTap: selectTimeOut,
                      controller: _timeOutController,
                      decoration: const InputDecoration(
                        hintText: 'Time Out',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.access_time),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            )
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          //edit schedule button
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                    child:  SizedBox(
                      width: 180,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () async {

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),

                        child: const Text('Finish Edit',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  )
                ),

                // remove button
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                    child: SizedBox(
                      width: 180,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () async {

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7676),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),

                        child: const Text('Remove Schedule',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectTimeIn() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );

    if (pickedTime != null) {
      setState(() {
        _timeInController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> selectTimeOut() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );

    if (pickedTime != null) {
      setState(() {
        _timeOutController.text = pickedTime.format(context);
      });
    }
  }
}

