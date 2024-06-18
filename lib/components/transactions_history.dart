import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_up_trips/main.dart';
import 'package:intl/intl.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({super.key});

  @override
  State<TransactionsHistory> createState() => _TransactionsHistory();
}

class _TransactionsHistory extends State<TransactionsHistory> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final appState = context.watch<MyAppState>();
    appState.transactionHistoryListKey = _key;

    if (appState.transactionHistory.isEmpty) {
      return const Center(child: Text('Sin transacciones realizadas.'));
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
          ),
          child: Text('Hay '
              '${appState.transactionHistory.length} ${appState.transactionHistory.length == 1 ? 'transacción' : 'transacciones'}:'),
        ),
        for (var transaction in appState.transactionHistory)
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction.description.toString(),
                  semanticsLabel: transaction.description,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${transaction.amount.toString()}",
                  semanticsLabel: "\$ ${transaction.amount.toString()}",
                ),
              ],
            ),
            subtitle: Text(
              DateFormat('dd MMMM yyyy').format(transaction.date),
              semanticsLabel: transaction.date.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontSize: 12.0),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete_outline),
              color: theme.colorScheme.primary,
              onPressed: () => appState.removeTransactionItem(transaction),
            ),
          ),
      ],
    );

    // ShaderMask(
    //   shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
    //   blendMode: BlendMode.dstIn,
    //   child: AnimatedList(
    //     key: _key,
    //     initialItemCount: appState.transactionHistory.length,
    //     itemBuilder: (context, index, animation) {
    //       final transaction = appState.transactionHistory[index];
    //       print(transaction);
    //       return SizeTransition(
    //         sizeFactor: animation,
    //         child: Expanded(
    //           child: TextButton.icon(
    //             iconAlignment: IconAlignment.end,
    //             onPressed: () {
    //               appState.removeTransactionItem(transaction);
    //             },
    //             icon: Icon(
    //               Icons.delete_outlined,
    //               size: 20,
    //             ),
    //             label: MergeSemantics(
    //               child: Wrap(
    //                 children: [
    //                   Text(
    //                     transaction.amount.toString(),
    //                     semanticsLabel: transaction.amount.toString(),
    //                     style: TextStyle(fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     transaction.date.toString(),
    //                     semanticsLabel: transaction.amount.toString(),
    //                     style: TextStyle(fontWeight: FontWeight.bold),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
