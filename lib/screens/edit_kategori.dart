import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasmobile/models/kategori.dart';
import 'package:uasmobile/providers/kategori_provider.dart';

class EditKategori extends StatefulWidget {
  final Kategori kategori;

  EditKategori([this.kategori]);

  @override
  _EditKategoriState createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  final kategoriIdController = TextEditingController();
  final namakategoriController = TextEditingController();
  final deskripsiController = TextEditingController();

  @override
  void dispose() {
    kategoriIdController.dispose();
    namakategoriController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.kategori == null) {
      //New Record
      kategoriIdController.text = "";
      namakategoriController.text = "";
      deskripsiController.text = "";
      new Future.delayed(Duration.zero, () {
        final kategoriProvider =
            Provider.of<KategoriProvider>(context, listen: false);
        kategoriProvider.loadValues(Kategori());
      });
    } else {
      //Controller Update
      kategoriIdController.text = widget.kategori.kategoriId;
      namakategoriController.text = widget.kategori.namakategori;
      deskripsiController.text = widget.kategori.deskripsi;
      //State Update
      new Future.delayed(Duration.zero, () {
        final kategoriProvider =
            Provider.of<KategoriProvider>(context, listen: false);
        kategoriProvider.loadValues(widget.kategori);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kategoriProvider = Provider.of<KategoriProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Kategori')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: kategoriIdController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Kode kategori'),
              onChanged: (value) {
                kategoriProvider.changekategoriId(value);
              },
            ),
            TextField(
              controller: namakategoriController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Nama Kategori'),
              onChanged: (value) {
                kategoriProvider.changeNamaKategori(value);
              },
            ),
            TextField(
              controller: deskripsiController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Deskripsi'),
              onChanged: (value) => kategoriProvider.changeDeskripsi(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                kategoriProvider.saveKategori();
                Navigator.of(context).pop();
              },
            ),
            (widget.kategori != null)
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Delete'),
                    onPressed: () {
                      kategoriProvider
                          .removeKategori(widget.kategori.kategoriId);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
