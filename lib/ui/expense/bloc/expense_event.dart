import 'package:equatable/equatable.dart';
import 'package:jaeger/db/purchase_db.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class FetchExpenseEvent extends ExpenseEvent {

  FetchExpenseEvent();

  @override
  List<Object> get props => [];

}

class DeleteExpenseEvent extends ExpenseEvent {
  final PurchaseData purchaseData;

  DeleteExpenseEvent(this.purchaseData);

  @override
  List<Object> get props => [purchaseData];

}