import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  static const String routeName = '/transaction';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
                appBar: AppBar(
                  title: const Text('Profil'),
                  	backgroundColor: Colors.red.shade900,
                  centerTitle: true,
                ),
                // drawer: createDrawer(context)
    ));
  }
}