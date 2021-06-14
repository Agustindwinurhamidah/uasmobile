import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasmobile/models/kategori.dart';
import 'package:uasmobile/screens/edit_kategori.dart';

class Kategoris extends StatelessWidget {
  static const String routeName = '/categories';
  @override
  Widget build(BuildContext context) {
    final kategoris = Provider.of<List<Kategori>>(context);
    return Scaffold(
        body: Container(
            child: Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
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
                  builder: (context) => EditKategori(),
                ),
              );
            },
          )
        ],
      ),
      body: (kategoris != null)
          ? ListView.builder(
              itemCount: kategoris.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(kategoris[index].kategoriId),
                  trailing: Text(
                    kategoris[index].namakategori,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditKategori(
                          kategoris[index],
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
