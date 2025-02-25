import 'package:sqflite/sqflite.dart';

final String tableProducts = 'products';
final String columnId = 'id';
final String columnProductName = 'name';
final String columnProductQuantity = 'quantity';
final String columnBarCode = 'bar_code';

class Products {
  int? id;
  String? name;
  double? quantity;
  int? barCode;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnId: id,
      columnProductName: name,
      columnProductQuantity: quantity,
      columnBarCode: barCode,
    };
    return map;
  }

  Products();
  Products.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnProductName];
    quantity = map[columnProductQuantity];
    barCode = map[columnBarCode];
  }
}

class ProductsTableProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
create table $tableProducts ( 
  $columnId integer primary key autoincrement, 
  $columnProductName text not null,
  $columnProductQuantity double not null,
  $columnBarCode integer not null
  )
''');
      },
    );

    print(db!.database.getVersion().toString());
  }
}
