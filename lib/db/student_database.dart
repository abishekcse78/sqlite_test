import 'package:sqflite/sqflite.dart';
import 'package:sqlite_test/data_model.dart';
import 'package:sqlite_test/strings.dart';

class StudentDatabase {
  static final StudentDatabase _databaseSingleton = StudentDatabase._internal();

  factory StudentDatabase() {
    return _databaseSingleton;
  }

  StudentDatabase._internal();

  final _fireDB = StudentDatabase.instance;

  /// Initialize DataBase
  static final StudentDatabase instance = StudentDatabase._init();
  static Database? _database;
  StudentDatabase._init();

  ///Get Path & Open DataBase (For More Details : https://docs.flutter.dev/cookbook/persistence/sqlite and https://pub.dev/packages/sqflite)
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    //filePath = 'students.db'
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    //Condition if the _database ('student.db) is there means, it will return the _database
    if (_database != null) return _database!;

    _database = await _initDB('students.db');
    return _database!;
  }

  ///Create Table
  Future _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE  $tableName($kTextId $kIdType, $kTextName $kNameType, $kTextAge $kAgeType)',
    );
  }

  ///Insert the Data into a Table
  Future<Students> create(Students student) async {
    final db = await instance.database;

    final id = await db.insert(tableName, student.toMap());
    var stud = student.copy(id: id);
    return stud;
  }

  ///Read the Data from a Table
  Future<List> readData(Students student) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Students(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  ///Update the Data into a Table
  Future<Future<int>> update(Students student) async {
    final db = await instance.database;

    return db.update(
      tableName,
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  ///Delete a Data from a Table
  Future<Future<int>> delete(Students student) async {
    final db = await instance.database;
    return db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  ///Close the DataBase
  Future close() async {
    final db = await instance.database;

    db.close();
  }

  join(String dbPath, String filePath) {}
}
