import 'package:flutter/material.dart';
import 'subjects.dart';

class AddActivities extends StatelessWidget {
  const AddActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const InputActivities(),
          Container(
            child: ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text('go back')),
          ),
        ],
      )
    );
  }

}

class InputActivities extends StatefulWidget {
  const InputActivities({super.key});

  @override
  State<InputActivities> createState() => _InputActivities();
}

class _InputActivities extends State<InputActivities> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  late String subjectDisplay = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(30),
        child:
        Column(
          children: [
            TextFormField(
              controller: _subjectController,
              readOnly: true,
              decoration: const InputDecoration(
                  labelText: 'SUBJECT',
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                  )
              ),
            ),

           subjectSelect(),

            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Title'
              ),
            ),

            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Details'
              ),
            ),

            const Text('Deadline'),

            TextFormField(
              readOnly: true,
              onTap: selectDate,
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'DATE',
                filled: true,
                prefixIcon: Icon(Icons.calendar_today),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
                )
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                readOnly: true,
                onTap: selectTime,
                controller: _timeController,
                decoration: const InputDecoration(
                    labelText: 'TIME',
                    filled: true,
                    prefixIcon: Icon(Icons.access_time),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    )
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget subjectSelect() {
    return FractionallySizedBox(
      widthFactor: 1,

      child: Container(
        decoration: const BoxDecoration(
          color: Colors.lightGreen,
        ),

        child: TextButton(
          style: TextButton.styleFrom(
          ),

          onPressed: () async{
            var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Subjects()),
            );

            setState(() {
              _subjectController.text = result;
            });
          },

          child: Text('Select Subject'),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2100)
    );

    if (_pickedDate != null) {
      setState(() {
        _dateController.text = _pickedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> selectTime() async {
    TimeOfDay? _pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );

    if (_pickedTime != null) {
      setState(() {
        _timeController.text = _pickedTime.format(context);
      });
    }
  }
}

