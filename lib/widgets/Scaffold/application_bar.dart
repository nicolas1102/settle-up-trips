import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Adjust height if needed
}
