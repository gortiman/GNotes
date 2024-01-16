// Import necessary packages
import 'package:goole_notes/test_code_folder/test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


// Class representing the SQLite database for notes
class NotesDatabse {
  // Singleton instance of the database
  static final NotesDatabse instance = NotesDatabse._init();

  // Database instance
  static Database? _database;

  // Private constructor for the singleton
  NotesDatabse._init();

  // Getter method for accessing the database asynchronously
  Future<Database?> get database async {
    // If the database is already initialized, return it
    if (_database != null) return _database;

    // Otherwise, initialize the database and return it
    _database = await _initializeDB('Notes.db');
    return _database;
  }

  // Method to initialize the database
  Future<Database> _initializeDB(String filepath) async {
    // Get the path for the database file
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    // Open or create the database with the specified path and version
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

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

  // Method to insert a new note into the database
  Future<Note?> insertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpNames.TableName, note.toJson());
    return note.copy(id: id);
  }

  // Method to read all notes from the database
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final queryResult = await db!.query(NotesImpNames.TableName, orderBy: orderBy);
    return queryResult.map((json) => Note.fromJson(json)).toList();  // send krenge json me data isko map me convert krna h,
  }

  // Method to read a specific note from the database using its ID
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
    final db = await instance.database;
    await db!.update(
      NotesImpNames.TableName,
      note.toJson(),
      where: '${NotesImpNames.id} = ?',
      whereArgs: [note.id],
    );
  }

  // Method to delete a note from the database
  Future deleteNote(Note note) async {
    final db = await instance.database;
    await db!.delete(
      NotesImpNames.TableName,
      where: '${NotesImpNames.id} = ?',
      whereArgs: [note.id],
    );
  }

  // Method to close the database
  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }
}
