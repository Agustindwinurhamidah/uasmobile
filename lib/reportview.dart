
import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  static const String routeName = '/reports';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
                appBar: AppBar(
                  title: const Text('Stok'),
                  	backgroundColor: Colors.red.shade900,
                  centerTitle: true,
                ),
                // drawer: Drawer(context)
    ));
  }
}