import 'package:equatable/equatable.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => [];

}

class PurchaseInitialState extends PurchaseState {
  PurchaseInitialState();

  @override
  List<Object> get props => [];
}

class PurchaseLoadingState extends PurchaseState {

  PurchaseLoadingState();

  @override
  List<Object> get props => [];
}

class PurchaseSuccessState extends PurchaseState {
  final String message;

  PurchaseSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class PurchaseFailureState extends PurchaseState {
  final String error;

  PurchaseFailureState(this.error);

  @override
  List<Object> get props => [error];
}