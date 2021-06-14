import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
      ),
      //drawer: cDrawer(context)
    ));
  }
}
