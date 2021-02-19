import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'purchase_db.g.dart';

class Purchase extends Table {
  IntColumn get amount => integer()();
  TextColumn get item => text()();
  TextColumn get date => text()();
  IntColumn get num => integer().autoIncrement()();

  //Set<Column> get primaryKey => { num };
}

@UseMoor(tables: [Purchase], daos: [PurchaseDao])
class PurchaseDataBase extends _$PurchaseDataBase {

  PurchaseDataBase(): super(FlutterQueryExecutor.inDatabaseFolder(path: 'purchase_db.sqlite',logStatements: true));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Purchase])
class PurchaseDao extends DatabaseAccessor<PurchaseDataBase> with _$PurchaseDaoMixin {

  final PurchaseDataBase db;

  PurchaseDao(this.db) : super(db);

  Future<List<PurchaseData>> getAllPurchases() {
    return select(purchase).get();
  }

  Stream<List<PurchaseData>> watchAllPurchases() {
    return select(purchase).watch();
  }

  Future insertPurchase(PurchaseData purchases) => into(purchase).insert(purchases);
  Future updatePurchase(PurchaseData purchases) => update(purchase).replace(purchases);
  Future deletePurchase(PurchaseData purchases) => delete(purchase).delete(purchases);
  Future deletePurchases() => delete(purchase).go();

}