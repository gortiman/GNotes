
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../MyNotesModel.dart';
import 'firestore_db.dart';

class NotesDatabase {
  // Singleton instance of the NotesDatabase class
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database; // Database instance variable.This variable holds the reference to the SQLite database.
  NotesDatabase._init(); // Private constructor for the singleton pattern

  // Getter method for accessing the database instance asynchronously. This getter is used to obtain a reference to the database.
  // Future<Database?> get database async {
  //   if (_database != null)
  //     return _database; // If the database is already initialized, return the existing instance
  //   _database = await _initializeDB(
  //       'Notes.db'); // If the database is not initialized, call the _initializeDB method
  //   return _database;
  // }

  Future<Database?> get database async {
    // If the database is already initialized, return it
    if (_database != null) return _database;

    // Otherwise, initialize the database and return it
    // _database = await _initializeDB('Notes.db');
    _database = await _initializeDB('NewNotes.db');
    return _database;
  }


  // Method to initialize the database.This method initializes the database by specifying its path and version.
  // It also defines the onCreate callback,
  // which is called when the database is created for the first time.
  // Future<Database> _initializeDB(String filepath) async {
  //   final dbPath =
  //       await getDatabasesPath(); // Get a location using path provider
  //   final path = join(dbPath, filepath); // Combine the path with the filename to get the full database path
  //   return await openDatabase(path,
  //       version: 1,
  //       onCreate: _createDB
  //   ); // Open the database with the specified path and version
  // }

  // Method to initialize the database
  Future<Database> _initializeDB(String filepath) async {
    // Get the path for the database file
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    // Open or create the database with the specified path and version
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Method to create the database table.
  //This method is called during the creation of the database.
  // It executes a SQL command to create the 'Notes' table
  // with columns for id, title, content, and createdTime
  // Future _createDB(Database db, int version) async {
  //   // Create the 'Notes' table with specified columns
  //   await db.execute('''
  //   CREATE TABLE Notes(
  //   id INTEGER PRIMARY KEY AUTOINCREMENT,
  //   pin BOOLEAN NOT NULL,
  //   title TEXT NOT NULL,
  //   content TEXT NOT NULL,
  //   createdTime TEXT NOT NULL,
  //   )
  //   ''');
  // }

  // Method to create the database tables
  Future _createDB(Database db, int version) async {
    // Define data types for SQL table creation
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    // Execute SQL command to create the 'Notes' table
    await db.execute('''
      CREATE TABLE Notes(
        ${NotesImpNames.id} $idType,
        ${NotesImpNames.pin} $boolType,
        ${NotesImpNames.title} $textType,
        ${NotesImpNames.content} $textType,
        ${NotesImpNames.createdTime} $textType
      )
    ''');
  }


  // Method to insert a new entry into the 'Notes' table
  // Future<bool?> InsertEntry() async {
  //   // Get the database instance
  //   final db = await instance.database;
  //   // Insert a record into the 'Notes' table with sample values
  //   await db?.insert("Notes", {
  //     "pin": false,
  //     "title": "This is my title",
  //     "content": "This is my first Note content",
  //     "createTime": "29 dec 2018"
  //   });
  //   return true;  // Return true to indicate the insertion was successful
  // }

  // Method to insert a new note into the database
  Future<Note?> insertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpNames.TableName, note.toJson());
    return note.copy(id: id);
  }

  // Future<String> readAllNotes() async{
  //   final db = await instance.database; // Establish a connection to the database
  //   final orderBy = 'createdTime ASC';  // Define the order in which the results should be retrieved from the database
  //   final query_result = await db!.query("Notes",orderBy: orderBy);  // Execute a query to retrieve all notes from the 'Notes' table, ordered by createdTime
  //   print(query_result);  // Print the result of the query to the console
  //   return "Successful";  // Return a string indicating the success of the operation
  // }

  // Method to read all notes from the database
  // Future<List<Note>> readAllNotes(int id) async {
  //   final db = await instance.database;
  //   final orderBy = '${NotesImpNames.createdTime} ASC';
  //   final queryResult = await db!.query(NotesImpNames.TableName, orderBy: orderBy);
  //   return queryResult.map((json) => Note.fromJson(json)).toList();  // send krenge json me data isko map me convert krna h,
  // }
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final queryResult = await db!.query(NotesImpNames.TableName, orderBy: orderBy);
    return queryResult.map((json) => Note.fromJson(json)).toList();  // send krenge json me data isko map me convert krna h,
  }

  // Future<String?> readOneNote(int id) async{
  //   final db = await instance.database;  // Establish a connection to the database
  //   final map = await db!.query("Notes",  // Execute a query to retrieve the title of a note with the specified id from the 'Notes' table
  //     columns: ["title"],
  //     where: 'id = ?',  // Specify the condition for the query
  //     whereArgs: [id]  // Provide the values for the condition (id in this case)
  //   );
  //   print(map);
  // }


  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(
      NotesImpNames.TableName,
      columns: NotesImpNames.values,
      where: '${NotesImpNames.id} = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
  }

  // Method to update an existing note in the database
  Future updateNote(Note note) async {
    await FireDB().updateNoteFirestore(note);
    final db = await instance.database;
    await db!.update(
      NotesImpNames.TableName,
      note.toJson(),
      where: '${NotesImpNames.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future pinNote(Note? note) async{
    final db = await instance.database;
    await db!.update(NotesImpNames.TableName,
        {NotesImpNames.pin: !note!.pin ? 1 : 0},
        where: '${NotesImpNames.id}=?',
        whereArgs: [note.id] );
  }
  Future archNote(Note? note) async{
    final db = await instance.database;
    await db!.update(NotesImpNames.TableName,
        {NotesImpNames.isArchieve: !note!.isArchieve ? 1 : 0},
        where: '${NotesImpNames.id}=?',
        whereArgs: [note.id] );
  }
  Future<List<int>> getNoteString(String query) async{
    final db = await instance.database;
    final result =await db!.query(NotesImpNames.TableName);
    List<int> resultIds = [];
    result.forEach((element) {
      if(element["title"].toString().toLowerCase().contains(query) || element["content"].toString().toLowerCase().contains(query)){
        resultIds.add(element["id"] as int);
      }
    });
    return resultIds;
  }

  Future deleteNote(Note? note) async {
    await FireDB().deleteNoteFirestore(note!);
    final db = await instance.database;
    await db!.delete(
      NotesImpNames.TableName,
      where: '${NotesImpNames.id} = ?',
      whereArgs: [note!.id],
    );
  }

  // Method to close the database
  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }
}
