import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studysync/add_activities.dart';

class Subjects extends StatefulWidget {

  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Column(
            children: [
              ElevatedButton(onPressed: () {
                var killka = AddSubject().badbo;
                Navigator.pop(context, killka);
              },
                  child: Text('go back')),

              AddSubject(),
            ],
          )
      ),
    );
  }
}

class AddSubject extends StatefulWidget {
  String badbo = '';

  AddSubject ({Key ? key}) : super(key: key);

  @override
  State<AddSubject> createState() => _AddSubject();
}

class _AddSubject extends State<AddSubject> {
  final subjectController = TextEditingController();

  List<String> subjectList = [];
  int? subjectIndex;

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
    return Column(
      children: [
        subjectListBuilder(),
        addSubjectFillUp(),
      ],
    );
  }

  Widget subjectListBuilder() {
    return SingleChildScrollView(
      child:
      SizedBox(
        height: 300,
        child:
        ListView.builder(
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
                    widget.badbo = subjectList[index];
                  });
                },

                leading: const Icon(Icons.book_rounded),
                title: Text(subjectList[index]),
                trailing: trailingButton(index),
              ),
            );
          },
        ),
      ),
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
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Enter subject Title',
          ),
        ),

        ElevatedButton(
            onPressed: () {
              subjectListSet();
            }, 
            child: const Text('add subject'))
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