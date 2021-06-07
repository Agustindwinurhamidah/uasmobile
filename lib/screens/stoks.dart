import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasmobile/models/stok.dart';
import 'package:uasmobile/screens/edit_stok.dart';


class Stoks extends StatelessWidget {
  static const String routeName = '/stok';

  @override
  Widget build(BuildContext context) {
      final stoks = Provider.of<List<Stok>>(context);
    return Scaffold(
       body: Container(
        child: Scaffold(
                appBar: AppBar(
                  title: const Text('Stok'),
                  	backgroundColor: Colors.red.shade900,
                  centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditStok(),
                ),
              );
            },
          )
        ],
      ),
      body: (stoks != null)
          ? ListView.builder(
              itemCount: stoks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(stoks[index].stokId),
                  trailing: Text(
                    stoks[index].namabarang,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditStok(
                          stoks[index],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    )));
  }
}