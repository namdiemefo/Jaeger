import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'package:jaeger/db/purchase_db.dart';
import 'package:jaeger/helper/alert.dart';
import 'package:date_format/date_format.dart';
import 'package:jaeger/helper/load.dart';
import 'package:intl/intl.dart';
import 'package:jaeger/helper/service_locator.dart';
import 'package:jaeger/ui/purchase/bloc/purchase_bloc.dart';
import 'package:jaeger/ui/purchase/bloc/purchase_event.dart';
import 'package:jaeger/ui/purchase/bloc/purchase_state.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage>
    with AutomaticKeepAliveClientMixin {
  final PurchaseRepository repository = locator<PurchaseRepository>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _expenseController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  String _item;
  int _amount;
  DateTime _date = DateTime.now();
  String _setDate;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xFF0D0838),
      body: SafeArea(
          child: BlocProvider(
              create: (context) => PurchaseBloc(repository: repository),
              child: Builder(
                builder: (context) => BlocListener<PurchaseBloc, PurchaseState>(
                  listenWhen: (prevState, currentState) {
                    if (prevState is PurchaseLoadingState) {
                      Load.dismiss(context);
                    }
                    return true;
                  },
                  listener: (context, state) {
                    if (state is PurchaseSuccessState) {
                      Alert(icon: Icons.check, title: state.message, subtitle: '' ).show(context);
                      _dateController.text = '';
                      _expenseController.text = '';
                      _amountController.text = '';
                    }

                    if (state is PurchaseFailureState) {
                      Alert(icon: Icons.report, title: state.error, subtitle: '' ).show(context);
                    }

                    if (state is PurchaseLoadingState) {
                      Load.show(context);
                    }

                  },

                  child: BlocBuilder<PurchaseBloc, PurchaseState>(
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        //padding: EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                                        child: Text('Enter Item', style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal
                                        ),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.83,
                                        child: TextFormField(
                                          controller: _expenseController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Item';
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontFamily: "ProximaNova",
                                          ),
                                          onSaved: (value) {
                                            _item = value;
                                          },
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.shopping_bag, color: Colors.white,),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.red.shade800)
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 25),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        //padding: EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                                        child: Text('Enter amount', style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal
                                        ),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.83,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _amountController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Amount';
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontFamily: "ProximaNova",
                                          ),
                                          onSaved: (value) {
                                            _amount = int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.money_sharp, color: Colors.white,),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.red.shade800)
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 25),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        //padding: EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                                        child: Text('Enter Date', style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal
                                        ),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.83,
                                          child: TextFormField(
                                            enabled: false,
                                            controller: _dateController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Enter Date';
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontFamily: "ProximaNova",
                                            ),
                                            onSaved: (value) {
                                              _setDate = value;
                                            },
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.calendar_today, color: Colors.white,),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white)
                                                ),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white)
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red.shade800)
                                                )
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 60),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.83,
                                        height: 70,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              if (_formKey.currentState.validate()) {
                                                _formKey.currentState.save();
                                                var purchase = PurchaseData(amount: _amount, item: _item, date: _setDate);
                                                BlocProvider.of<PurchaseBloc>(context).add(SavePurchaseEvent(purchase));
                                              }
                                            },
                                            child: Text('Submit')
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),

                ),
              )
          )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future _selectDate(BuildContext context) async {

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2020),
        lastDate: DateTime(2101)
    );

    if (picked != null) {
      setState(() {
        _date = picked;
       _dateController.text = DateFormat.yMd().format(_date);
      });
    }

  }
}
