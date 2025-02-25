import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db{
Db._();

static final Db instance = Db._();

static Database? _database;

get database async{
  if(_database != null) return _database;

  return await _initDatabase();
}

_initDatabase() async{
  return await openDatabase(
    join(await getDatabasesPath(), 'stock.db'),version: 1,onCreate: _onCreate
  );
}
_onCreate(db,versao)async{
  await db.execute(_products);

}

String get _products => '''
create table products ( 
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  product_name TEXT NOT NULL,
  product_quantity INTEGER NOT NULL,
  product_barcode INTEGER NOT NULL
  )
);
''';
   }