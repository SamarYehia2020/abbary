import 'package:abbar_app/db_home.dart';
import 'package:abbar_app/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesScren extends StatefulWidget {
  const AddNotesScren({Key? key}) : super(key: key);

  @override
  State<AddNotesScren> createState() => _AddNotesScrenState();
}

class _AddNotesScrenState extends State<AddNotesScren> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Add Note")),
            body: Center(
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListView(
                  children: [
                    Form(
                        key: formstate,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: title,
                              decoration: InputDecoration(
                                  hintText: "Title",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: note,
                              decoration: InputDecoration(
                                  hintText: "Note",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: color,
                              decoration: InputDecoration(
                                  hintText: "Color",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0))),
                            ),
                            TextButton(
                                onPressed: () async {
                                  int response = await sqlDb.insertData('''
INSERT INTO notes (`note`,`color`,`title`) VALUES ("${note.text}","${color.text}","${title.text}")
''');

                                  if (response > 0) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (_) => DbHome()),
                                        (route) => false);
                                  }
                                },
                                child: Text("Add Note"))
                          ],
                        ))
                  ],
                ),
              ),
            )));
  }
}
