import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_up_trips/components/HistoryListView.dart';
import 'package:settle_up_trips/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: HistoryListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text('Título del BottomSheet'),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color(0xfff7f8f8),
        child: Icon(Icons.add),
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  var appState = context.watch<MyAppState>();
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
