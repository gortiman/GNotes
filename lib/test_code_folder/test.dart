/// This code defines a data model for representing and manipulating notes,
/// including serialization and deserialization to and from JSON.
/// The NotesImpNames class provides constants for field names and the table name,
/// and the Note class represents individual notes with various attributes.


// This class defines the names of fields and table for storing notes in a database.
class NotesImpNames {
  // Constants for field names
  static final String id = "id";    // id hm define kiye h , or "id" database me define h. same niche ke fields v h
  static final String pin = "pin";
  static final String title = "title";
  static final String content = "content";
  static final String createdTime = "createdTime";   // naam to string hi hoga n isliye string type ka h, lekin data datetime hoga

  // Constant for the table name
  static final String TableName = "Notes";

  // List of all field names
  static final List<String> values = [id, pin, title, content, createdTime];
}

// This class represents a Note with various attributes.
class Note {
  // Fields of a Note
  final int? id;
  final bool pin;
  final String title;
  final String content;
  final DateTime createdTime;

  // Constructor for creating a Note.
  // It allows creating an instance of Note with optional named parameters (id, pin, title, content, createdTime).
  const Note({
    this.id,
    required this.pin,
    required this.title,
    required this.content,
    required this.createdTime,
  });

  /// 2 functions create krenge ek function crete krenge jo todo naam ka object jo rehga jo map bnayenge model pe se
  /// usse use json me convet krne ke liye or jo json se data aa rha h use map me convert krne ke liye
  ///  aisa isliye ki jo note object h wo use ho skta h app me lekin database me ise use nhi kr skte
  ///  hme json me data bhejna pdega database me . or jo waha se data aayega wo json me aayega or use hm app me use nhi kr skte
  ///  use map(object) me convert krna pdega


  // Method for creating a copy of a Note with optional parameter values
  //-----ek copy bna rhe h constructor ki , ye isliye kr rhe h ki jo database h usme id daal ske
  Note copy({
    int? id,
    bool? pin,
    String? title,
    String? content,
    DateTime? createdTime,
  }) {
    return Note(
      id: id ?? this.id,  //pin agr null return kr rha h to this.pin means jo pehle wala pin h wo daal do, same below fields
      pin: pin ?? this.pin,
      title: title ?? this.title,
      content: content ?? this.content,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  // Static method to create a Note from a JSON map
  //  It takes a map as an argument, extracts values using field names from NotesImpNames,
  //  and creates a new Note instance.
  /// fromJson type ka name de rhe h , isme data aayega map type ka,
  /// or map me data string object type ka aayega, fir likhenge json ki hme json me se convert krna h
  /// id:json isliye ki 'Object?> json' is pure ko json bol rhe h
  /// ----------ye method json se map me convert kr dega----------------------
  static Note fromJson(Map<String, Object?> json) {
    return Note(
      id: json[NotesImpNames.id] as int?,
      pin: json[NotesImpNames.pin] == 1,
      title: json[NotesImpNames.title] as String,
      content: json[NotesImpNames.content] as String,  // as String - string me typecast kr rhe h
      createdTime: DateTime.parse(json[NotesImpNames.createdTime] as String),
    );
  }

  // Method to convert a Note to a JSON map.
  // This is a method within the Note class for converting a Note instance to a JSON map.
  // It returns a map where keys are field names from NotesImpNames,
  // and values are the corresponding values from the Note instance.
  /// map se json me convert kr dega jisko paas krayenge database me
  Map<String, Object?> toJson() {
    return {
      NotesImpNames.id: id,
      NotesImpNames.pin: pin ? 1 : 0,
      NotesImpNames.title: title,
      NotesImpNames.content: content,
      NotesImpNames.createdTime: createdTime.toIso8601String(),
    };
  }
}


/// Serialization is the process of converting an object or data structure into a format that can be easily stored or transmitted,
/// such as JSON (JavaScript Object Notation). Deserialization is the opposite process,
/// where the serialized data is converted back into its original object or data structure.

/// In the provided Dart code, the Note class has methods for both serialization (toJson()) and deserialization (fromJson()).

/// Serialization (toJson()):

// The toJson() method in the Note class converts a Note object into a JSON format, which is a map in Dart.
// The keys of the map are the field names from the NotesImpNames class (id, pin, title, content, createdTime).
// The values are the corresponding attributes of the Note instance (id, pin, title, content, createdTime).
// The pin field is converted to an integer (1 for true, 0 for false) because JSON doesn't directly represent boolean values.
// Example:

// {
// "id": 1,
// "pin": 1,
// "title": "Sample Title",
// "content": "Sample Content",
// "createdTime": "2024-01-02T12:34:56.789Z"
// }
/// Deserialization (fromJson()):
//
// The fromJson() method in the Note class takes a JSON map as input.
// It extracts values using the field names from the NotesImpNames class (
// NotesImpNames.id, NotesImpNames.pin, NotesImpNames.title, NotesImpNames.content, NotesImpNames.createdTime).
// It converts the extracted values to the appropriate types (e.g., parsing the createdTime string into a DateTime object).
// It then creates and returns a new Note instance with the extracted values.
// Example:
//

// {
// "id": 1,
// "pin": 1,
// "title": "Sample Title",
// "content": "Sample Content",
// "createdTime": "2024-01-02T12:34:56.789Z"
// }
// Results in a Note instance with id: 1, pin: true, title: "Sample Title", content: "Sample Content", and
// createdTime: DateTime(2024, 01, 02, 12, 34, 56, 789).
//
/// These methods are crucial when you need to store or transmit data in a structured format,
/// like when saving objects to a file or sending them over the network. JSON is a common choice due to its simplicity,
/// human-readability, and wide support in various programming languages.

