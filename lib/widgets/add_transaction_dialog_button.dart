import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_up_trips/main.dart';
import 'package:settle_up_trips/models/models.dart';

class AddTransactionDialog extends StatelessWidget {
  // control de datos del dialog
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton.extended(
      label: Text(
        'Agregar Transacción',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Agregar Transacción'),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const Text('Aquí puedes agregar una nueva transacción.'),
              const SizedBox(height: 10.0),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Monto',
                    prefixIcon: Icon(Icons.attach_money_sharp)),
                keyboardType: TextInputType.number,
              ),
            ]),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  amountController.text = '';
                  descriptionController.text = '';
                  Navigator.pop(context, 'Cancel');
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  var transaction = Transaction(
                      amount: int.parse(amountController.text),
                      description: descriptionController.text,
                      date: DateTime.now());
                  appState.addTransactionItem(transaction);
                  amountController.text = '';
                  descriptionController.text = '';
                  Navigator.pop(context, 'OK');
                },
                child: const Text('Agregar'),
              ),
            ],
          ),
        );
      },
      icon: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: colorScheme.onSecondaryContainer,
    );
  }
}
