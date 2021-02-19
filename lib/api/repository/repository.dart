import 'package:dio/dio.dart';
import 'package:jaeger/api/client/client.dart';
import 'package:jaeger/db/purchase_db.dart';

abstract class IPurchaseRepository {
  Stream<List<PurchaseData>> getPurchases();
  Future<List<PurchaseData>> getAllPurchases();
  Future savePurchase(PurchaseData purchases);
  Future getFilms();
  Future deletePurchase(PurchaseData purchaseData);
  Future deletePurchases();
}

class PurchaseRepository implements IPurchaseRepository {

  Dio dio;
  Client client;
  PurchaseDao _purchaseDao;

  PurchaseRepository(this._purchaseDao) {
    dio = new Dio();
    client = new Client(dio);
  }

  @override
  Future deletePurchases() async {
    return await _purchaseDao.deletePurchases();
  }

  @override
  Future<List<PurchaseData>> getAllPurchases() async {
    return await _purchaseDao.getAllPurchases();
  }

  @override
  Stream<List<PurchaseData>> getPurchases() {
    return _purchaseDao.watchAllPurchases();
  }

  @override
  Future savePurchase(PurchaseData purchases) async {
    return await _purchaseDao.insertPurchase(purchases);
  }

  @override
  Future getFilms() async {
    try {
      var films = await client.getFilm();
      return films;
    } catch(error, stackTrace) {
      return 'Something went wrong';
    }

  }

  @override
  Future deletePurchase(PurchaseData purchaseData) async {
    return await _purchaseDao.deletePurchase(purchaseData);
  }

}