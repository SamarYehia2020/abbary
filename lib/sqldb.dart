import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  } //function for initializing sqlflite

  initDb() async {
    String databasePath = await getDatabasesPath(); //default path for db
    String path = join(databasePath, "samar.db");
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 14,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    //called when we changed the num of version at openDatabase
    print("upgrade===================================>");
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
    await db.execute("ALTER TABLE notes ADD COLUMN title TEXT");
  }

  _onCreate(Database db, int version) async {
    //on create called one time at the creation of db so when making
    //any update we should use upgrade function
    //we can use Batch when we want to make more than one table and it can do more than one process and execute it one time

    Batch batch = db.batch();
    batch.execute(''' CREATE TABLE "notes"(
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   "note" TEXT NOT NULL

 )

 ''');
    batch.execute(''' CREATE TABLE "products"(
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   "product" TEXT NOT NULL

 )

 ''');
    await batch.commit(); //batch for more then one table
//     await db.execute('''     //for one table
// CREATE TABLE "notes"(
//   "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//   "note" TEXT NOT NULL

// )

// '''); //autoincrement should be at the last , the name of table musn't be rhe name of column,
//the name of column prefered to be in double quotation

    print("create===================================>");
  }

  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql); //when making select
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updatetData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  mydeleteDatabase() async {
    String databasePath = await getDatabasesPath(); //default path for db
    String path = join(databasePath, "samar.db");
    await deleteDatabase(path);
    print("deleted==============>");
  }

  //////////////////////////////////////////////////////////////////
  read(String table) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.query(table); //when making select
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object> value, String where) async {
    Database? myDb = await db;
    int response = await myDb!.update(table, value, where: where);
    return response;
  }

  delete(String table, String where) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table, where: where);
    return response;
  }
}
