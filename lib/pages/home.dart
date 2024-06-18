import 'package:flutter/material.dart';
import 'package:settle_up_trips/widgets/Scaffold/application_bar.dart';
import 'package:settle_up_trips/widgets/add_transaction_dialog_button.dart';
import 'package:settle_up_trips/widgets/buttom_bar.dart';
import 'package:settle_up_trips/widgets/transactions_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: ApplicationBar(colorScheme: colorScheme),
      body: TransactionsHistory(),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: AddTransactionDialog(),
    );
  }
}
