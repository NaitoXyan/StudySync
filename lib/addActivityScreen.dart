import 'package:flutter/material.dart';
import 'subjects.dart';

class AddActivities extends StatelessWidget {
  const AddActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xff1E213D),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E213D),
          title: const Text('Add Activity',
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
          child: InputActivities(),
        ),
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Text('Subject',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                TextFormField(
                  controller: _subjectController,
                  readOnly: true,
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

                ListTile(
                  //pag click mo navigate sa select subject screen
                  onTap: () async{
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Subjects()),
                    );

                    setState(() {
                      _subjectController.text = result;
                    });
                  },
                ),
              ],
            )
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Title',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Title',
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

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Description',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),

          //text-field for details
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Description',
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

          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 12),
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
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      readOnly: true,
                      onTap: selectDate,
                      controller: _dateController,
                      decoration: const InputDecoration(
                          hintText: 'DATE',
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
                      onTap: selectTime,
                      controller: _timeController,
                      decoration: const InputDecoration(
                          hintText: 'TIME',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.access_time),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFCC72C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                child: const Text('Apply Changes',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),

        ],
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

