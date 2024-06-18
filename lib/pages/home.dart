import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_up_trips/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settle Up Trips',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xfff7f8f8),
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          
        ],
      ),
    );
  }
}
