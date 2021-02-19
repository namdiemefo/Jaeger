import 'package:get_it/get_it.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'package:jaeger/db/purchase_db.dart';

GetIt locator = GetIt();
void setUpLocator() {
  locator.registerLazySingleton(() => PurchaseRepository(PurchaseDao(PurchaseDataBase())));
}