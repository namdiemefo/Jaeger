import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'package:jaeger/db/purchase_db.dart';
import 'package:jaeger/helper/service_locator.dart';
import 'package:jaeger/ui/expense/bloc/expense_event.dart';
import 'package:jaeger/ui/expense/bloc/expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final PurchaseRepository repository;
  ExpenseBloc({ExpenseState initialState, this.repository}) : assert(repository != null), super(initialState);

  @override
  Stream<ExpenseState> mapEventToState(ExpenseEvent event) async* {
    if (event is FetchExpenseEvent) {
      yield* _fetchExpenses();
    } else if (event is DeleteExpenseEvent) {
      yield* _deleteExpense(event);
    }
  }

  Stream<ExpenseState> _fetchExpenses() async* {
     PurchaseData purchase;
     var purchases = await repository.getAllPurchases();
     List<int> amountArray = [0];

     for (purchase in purchases) {
       amountArray.add(purchase.amount);
     }

     int amount =  amountArray.reduce((value, element) => value + element);

     if (purchases is List<PurchaseData>) {
       yield ExpenseSuccessState(purchases, amount);
     } else {
       yield ExpenseFailureState(purchases.toString());
     }
  }

  Stream<ExpenseState> _deleteExpense(DeleteExpenseEvent event) async* {
    yield ExpenseLoadingState();
    var delete = await repository.deletePurchase(event.purchaseData);
    Future.delayed(Duration(seconds: 3), () async* {

    });
    if (delete == 1) {
      yield DeleteExpenseSuccessState('${event.purchaseData.item} has been deleted');
    } else {
      yield DeleteExpenseFailureState('something went wrong');
    }


  }

}