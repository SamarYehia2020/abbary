import 'package:abbar_app/edit_note_screen.dart';
import 'package:abbar_app/sqldb.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  SqlDb sqlDb = SqlDb();
  List notes = [];
  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'notes'");
    notes.addAll(response);
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
      appBar: AppBar(title: Text("Notes Home")),
      body: Container(
        child: ListView(
          children: [
            ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => EditNotesScreen(
                                          id: notes[index]['id'],
                                        )));
                            print(notes[index]['id']);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () async {
                            int response = await sqlDb.deleteData(
                                "DELETE FROM notes WHERE id=${notes[index]['id']}");
                            if (response > 0) {
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (_) => NotesScreen()));
                              notes.removeWhere((element) =>
                                  element['id'] == notes[index]['id']);
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                  subtitle: Text(notes[index]['note']),
                  title: Text(notes[index]['title']),
                ),
              ),
              // Text("${snapshot.data![index]['note']}"),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            )
          ],
        ),
      ),
    ));
  }
}
