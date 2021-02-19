import 'package:equatable/equatable.dart';
import 'package:jaeger/db/purchase_db.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object> get props => [];
}

class SavePurchaseEvent extends PurchaseEvent {
  final PurchaseData purchaseData;
  SavePurchaseEvent(this.purchaseData);

  @override
  List<Object> get props => [purchaseData];

}