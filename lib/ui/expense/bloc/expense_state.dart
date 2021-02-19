import 'package:equatable/equatable.dart';
import 'package:jaeger/db/purchase_db.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];

}

class ExpenseInitialState extends ExpenseState {
  ExpenseInitialState();

  @override
  List<Object> get props => [];
}

class ExpenseLoadingState extends ExpenseState {

  ExpenseLoadingState();

  @override
  List<Object> get props => [];
}

class ExpenseSuccessState extends ExpenseState {
  final List<PurchaseData> purchaseData;
  final int amount;

  ExpenseSuccessState(this.purchaseData, this.amount);

  @override
  List<Object> get props => [purchaseData, amount];
}

class DeleteExpenseSuccessState extends ExpenseState {
  final String message;
  DeleteExpenseSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class ExpenseFailureState extends ExpenseState {
  final String error;

  ExpenseFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class DeleteExpenseFailureState extends ExpenseState {
  final String error;
  DeleteExpenseFailureState(this.error);

  @override
  List<Object> get props => [error];
}