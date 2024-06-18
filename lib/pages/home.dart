import 'package:flutter/material.dart';
import 'package:settle_up_trips/components/add_transaction_dialog.dart';
import 'package:settle_up_trips/components/transactions_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: TransactionsHistory(),
      floatingActionButton: AddTransaction(),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Settle Up Trips',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    // leading: Container(
    //   margin: const EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //       color: const Color(0xfff7f8f8),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: Center(
    //     child: IconButton(
    //         onPressed: () {}, iconSize: 20.0, icon: Icon(Icons.arrow_back)),
    //   ),
    // ),
    actions: [],
  );
}
