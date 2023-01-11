import 'package:abbar_app/db_home.dart';
import 'package:abbar_app/notes_screen.dart';
import 'package:abbar_app/sqldb.dart';
import 'package:flutter/material.dart';

class EditNotesScreen extends StatefulWidget {
  int id;
  EditNotesScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  SqlDb sqlDb = SqlDb();
  List notes = [];
  Future readData() async {
    var response =
        await sqlDb.readData("SELECT * FROM notes WHERE id=${widget.id}");
    notes = response;
    print(response);
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Edit Note")),
      body: Container(
        child: ListView(
          children: [
            Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                          hintText: notes[0]['title'],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: note,
                      decoration: InputDecoration(
                          hintText: notes[0]['note'],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: color,
                      decoration: InputDecoration(
                          hintText: notes[0]['color'],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))),
                    ),
                    TextButton(
                        onPressed: () async {
//                           await sqlDb.deleteData('''
// DELETE FROM notes WHERE id=${widget.id}
//  ''');

//                           var response = await sqlDb.updatetData('''
// INSERT INTO notes (`note`,`title`,`color`) VALUES ("${note.text}","${title.text}","${color.text}")
//  ''');
                          var response = await sqlDb.updatetData('''
UPDATE notes SET note="${note.text}", title="${title.text}", color="${color.text}" WHERE id="${widget.id}"
  ''');

                          if (response > 0) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => NotesScreen()));
                          }
                        },
                        child: Text("Edit Note"))
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
