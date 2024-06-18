import 'package:flutter/material.dart';
import 'package:settle_up_trips/models/models.dart';
import 'package:settle_up_trips/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Settle Up Trips', // Titulo del explorador
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily: 'Oswald',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 4, 6, 43)),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var transactionHistory = <Transaction>[];

  GlobalKey? transactionHistoryListKey;

  void addTransactionItem(Transaction transaction) {
    transactionHistory.insert(0, transaction);
    var animatedList = transactionHistoryListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    notifyListeners();
  }

  void removeTransactionItem(Transaction transaction) {
    transactionHistory.remove(transaction);
    notifyListeners();
  }
}
