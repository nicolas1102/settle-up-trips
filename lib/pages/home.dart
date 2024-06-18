import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_up_trips/components/add_transaction_dialog.dart';
import 'package:settle_up_trips/components/transactions_history.dart';
import 'package:intl/intl.dart';
import 'package:settle_up_trips/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: TransactionsHistory(),
      bottomNavigationBar: _DemoBottomAppBar(),
    );
  }
}

AppBar appBar(BuildContext context) {
  var colorScheme = Theme.of(context).colorScheme;
  return AppBar(
    title: const Text(
      'Settle Up Trips',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: colorScheme.onSecondaryContainer,
    elevation: 0.0,
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

class _DemoBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.watch<MyAppState>();
    return BottomAppBar(
      height: 101.0,
      color: colorScheme.onSecondaryContainer,
      child: IconTheme(
        data: IconThemeData(color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Text(
                  "\$${NumberFormat.currency(locale: 'es_CO', symbol: '', decimalDigits: 2).format(appState.total)}",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
            AddTransactionDialog(),
          ],
        ),
      ),
    );
  }
}
