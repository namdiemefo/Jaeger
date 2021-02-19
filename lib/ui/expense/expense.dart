import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'package:jaeger/db/purchase_db.dart';
import 'package:jaeger/helper/alert.dart';
import 'package:jaeger/helper/load.dart';
import 'package:jaeger/helper/service_locator.dart';
import 'package:jaeger/ui/expense/bloc/expense_event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/expense_bloc.dart';
import 'bloc/expense_state.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> with AutomaticKeepAliveClientMixin {

  final PurchaseRepository repository = locator<PurchaseRepository>();
  var _refreshController = RefreshController(initialRefresh: true);
  String _error = 'No Expenses';
  List<PurchaseData> _expenses;
  int _totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
          create: (context) => ExpenseBloc(repository: repository),
          child: Builder(
            builder: (context) => BlocListener<ExpenseBloc, ExpenseState>(
              listenWhen: (prevState, currentState) {
                if (prevState is ExpenseLoadingState) {
                  Load.dismiss(context);
                }
                return true;
              },
              listener: (context, state) {

                if (state is ExpenseLoadingState) {
                  Load.show(context);
                }

                if (state is ExpenseFailureState) {
                  _refreshController.refreshFailed();
                }

                if (state is DeleteExpenseSuccessState) {
                  Alert(icon: Icons.delete, title: state.message, subtitle: '').show(context);
                  BlocProvider.of<ExpenseBloc>(context).add(FetchExpenseEvent());
                }

              },
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (context, state) {
                    if (state is ExpenseSuccessState) {
                      _refreshController.refreshCompleted();
                      _expenses = state.purchaseData;
                      _totalAmount = state.amount;

                    }
                    return Scaffold(
                      appBar: AppBar(title: Text('Total Amount: $_totalAmount')),
                      backgroundColor: Color(0xFF0D0838),
                      body: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF0D0838)
                          ),
                          child: SizedBox.expand(
                            child: SmartRefresher(
                              enablePullDown: true,
                              enablePullUp: false,
                              onRefresh: () async {
                                BlocProvider.of<ExpenseBloc>(context).add(FetchExpenseEvent());
                              },
                              controller: _refreshController,
                              child: _expenses == null || _expenses.length < 1 ? Center(
                                child: Text('$_error', style: TextStyle(color: Colors.white)),
                              ) :
                              ListView.builder(
                                  itemCount: _expenses.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      height: 80,
                                      child: Slidable(
                                        secondaryActions: [
                                          IconSlideAction(
                                            caption: 'Delete',
                                            color: Colors.redAccent,
                                            icon: Icons.restore_from_trash,
                                            onTap: () {
                                              BlocProvider.of<ExpenseBloc>(context).add(DeleteExpenseEvent(_expenses[index]));
                                            },
                                          )
                                        ],
                                        actionPane: SlidableDrawerActionPane(),
                                        actionExtentRatio: 0.25,
                                        child: Card(
                                          color: Colors.white,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.shopping_bag),
                                                      SizedBox(width: 10),
                                                      Text('${_expenses[index].item}', style: TextStyle(fontWeight: FontWeight.w600 ,color:  Color(0xFF062D73)),),
                                                      Spacer(flex: 5,),
                                                      Text('${_expenses[index].date}', style: TextStyle(color: Color(0xFF7D7D7D)))
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 5,
                                                  ),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(width: 5),
                                                      Text('Amount:', style: TextStyle(fontWeight: FontWeight.w600 ,color: Color(0xFF000000)),),
                                                      SizedBox(width: 3),
                                                      Text('N ${_expenses[index].amount.toDouble()}', style: TextStyle(color:  Color(0xFF062D73)),)
                                                    ],
                                                  )
                                                ],
                                              )
                                          ),

                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          )
                      ),
                    );
                  }
              ),
            ),
          ),

        );
  }

  @override
  bool get wantKeepAlive => true;
}

