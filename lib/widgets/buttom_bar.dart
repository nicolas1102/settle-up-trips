import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:settle_up_trips/main.dart';

class BottomBar extends StatelessWidget {
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
            // AddTransactionDialog(),
          ],
        ),
      ),
    );
  }
}
