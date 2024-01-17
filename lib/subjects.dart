import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  //main subject screen
  final subjectController = TextEditingController();
  List<String> subjectList = [];
  int? subjectIndex;
  String subjectCardKey = '';

  @override
  void initState() {
    super.initState();
    subjectListGet();
  }

  @override
  void dispose () {
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff1E213D),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E213D),
          title: const Text('Subjects',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          leading: BackButton(
            onPressed: () {
              String sendSubjectToPrevScreen = subjectCardKey;
              Navigator.pop(context, sendSubjectToPrevScreen);
            },
          ),
        ),

        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: subjectListBuilder()
                ),
              ),
            ),

            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: addSubjectFillUp(),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget subjectListBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: subjectList.length,

      itemBuilder: (context, index) {
        return Card(
          color: subjectIndex == index ? Colors.blue: null,
          child: ListTile(
            onTap: () {
              setState(() {
                subjectIndex = index;
                subjectCardKey = subjectList[index];
              });
            },

            leading: const Icon(Icons.book_rounded),
            title: Text(subjectList[index]),
            trailing: trailingButton(index),
          ),
        );
      },
    );
  }

  ListTileTitleAlignment? titleAlignment;
  Widget trailingButton(int index) {
    return PopupMenuButton<ListTileTitleAlignment>(
        onSelected: (ListTileTitleAlignment? value) {
          setState(() {
            titleAlignment = value;
          });
        },

        itemBuilder: (BuildContext context) =>
        <PopupMenuEntry<ListTileTitleAlignment>>[
          PopupMenuItem<ListTileTitleAlignment>(
            onTap:() {
              subjectDelete(index);
            },
            value: ListTileTitleAlignment.center,
            child: const Text("delete"),

          )
        ]
    );
  }

  Widget addSubjectFillUp() {
    return Column(
      children: [
        TextFormField(
          controller: subjectController,
          style: const TextStyle(
            color: Colors.white
          ),
          decoration: const InputDecoration(
            labelText: 'Enter subject Title',
            labelStyle: TextStyle(
              color: Colors.white
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              )
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              )
            )
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            width: 250,
            height: 70,
            child: ElevatedButton(
                onPressed: () {
                  subjectListSet();
                },
                child: const Text('add subject',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ),
                )
            ),
          ),
        )
      ],
    );
  }

  Future <void> subjectListSet() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      subjectList.add(subjectController.text);
      prefs.setStringList('subjects', subjectList);
    });

    subjectController.clear();
  }

  Future <void> subjectListGet() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      subjectList = prefs.getStringList('subjects') ?? [];
    });
  }

  Future <void> subjectDelete(int index) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      subjectList.removeAt(index);
      prefs.setStringList('subjects', subjectList);
    });
  }
}