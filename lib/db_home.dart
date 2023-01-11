import 'package:abbar_app/add_note_screen.dart';
import 'package:abbar_app/notes_screen.dart';
import 'package:abbar_app/sqldb.dart';
import 'package:abbar_app/view/screens/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DbHome extends StatefulWidget {
  const DbHome({Key? key}) : super(key: key);
  @override
  State<DbHome> createState() => _DbHomeState();
}

class _DbHomeState extends State<DbHome> {
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Database Home")),
      body: Container(
        child: Column(
          children: [
            Center(
              child: TextButton(
                  onPressed: () async {
                    List<Map> respone =
                        // await sqlDb.readData("SELECT * FROM 'notes' ");
                        await sqlDb.read("notes");
                    print(respone);
                  },
                  child: Text("Read Data")),
            ),
            Center(
              child: TextButton(
                  onPressed: () async {
                    int response =
                        //  await sqlDb.insertData(
                        //     "INSERT INTO 'notes' ('note','color','title') VALUES ('note two','yellow','hiiii')");
                        await sqlDb.insert("notes", {
                      'note': 'note two',
                      'color': "yellow",
                      'title': 'hiiiii'
                    });
                    print(response);
                  },
                  child: Text("Insert Data")),
            ),
            Center(
              child: TextButton(
                  onPressed: () async {
                    int response =
                        // await sqlDb.deleteData("DELETE FROM 'notes'");
                        await sqlDb.delete("notes", "id=3");
                    print(response);
                  },
                  child: Text("Delete Data")),
            ),
            Center(
              child: TextButton(
                  onPressed: () async {
                    int response =
                        // await sqlDb.updatetData(
                        //     "UPDATE 'notes' SET 'note'='note six' WHERE id=6");
                        await sqlDb.update(
                            "notes", {'note': 'note seven'}, "id=11");
                    print(response);
                  },
                  child: Text("Update Data")),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Get.to(() => NotesScreen());
                  },
                  child: Text("Go To Another Page")),
            ),
            Center(
              child: TextButton(
                  onPressed: () async {
                    await sqlDb.mydeleteDatabase();
                  },
                  child: Text("Delete Database")),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNotesScren());
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
