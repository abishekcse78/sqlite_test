import 'package:sqlite_test/strings.dart';

class Students {
  final String name;
  final String id;
  final String age;

  const Students({
    required this.name,
    required this.id,
    required this.age,
  });

  ///This  Method Convert the Students into Map
  Map<String, dynamic> toMap() {
    return {
      kTextId: id,
      kTextName: name,
      kTextAge: age,
    };
  }

  ///Copy of Above Students (We Stored the Data of Above kTextId, KTextName, kTextAge again below)
  Students copy({
    required int id,
    int? age,
    String? name,
  }) {
    return Students(
      id: this.id,
      age: this.age,
      name: this.name,
    );
  }
}
