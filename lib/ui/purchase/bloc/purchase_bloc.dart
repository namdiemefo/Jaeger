import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'purchase_event.dart';
import 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final PurchaseRepository repository;

  PurchaseBloc({PurchaseState initialState, this.repository}) : assert(repository != null), super(initialState);

  @override
  Stream<PurchaseState> mapEventToState(PurchaseEvent event) async* {
    if (event is SavePurchaseEvent) {
      yield* _savePurchase(event);
    }
  }

  Stream<PurchaseState> _savePurchase(SavePurchaseEvent event) async* {
    yield PurchaseLoadingState();
    Future.delayed(Duration(seconds: 3), () async* {

    });
    await repository.savePurchase(event.purchaseData);
    yield PurchaseSuccessState('Purchase saved successfully');


  }

}