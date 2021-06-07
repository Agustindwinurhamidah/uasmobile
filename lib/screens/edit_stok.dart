
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasmobile/models/stok.dart';
import 'package:uasmobile/providers/stok_provider.dart';


class EditStok extends StatefulWidget {
  final Stok stok;

  EditStok([this.stok]);

  @override
  _EditStokState createState() => _EditStokState();
}

class _EditStokState extends State<EditStok> {
  final stokIdController = TextEditingController();
  final namabarangController = TextEditingController();
  final hargabarangController = TextEditingController();
  final stokbarangController = TextEditingController();

  @override
  void dispose() {
    stokIdController.dispose();
    namabarangController.dispose();
    hargabarangController.dispose();
    stokbarangController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.stok == null) {
      //New Record
      stokIdController.text = "";
      namabarangController.text = "";
      hargabarangController.text = "";
      stokbarangController.text = "";
      new Future.delayed(Duration.zero, () {
        final stokProvider = Provider.of<StokProvider>(context, listen: false);
        stokProvider.loadValues(Stok());
      });
    } else {
      //Controller Update
      stokIdController.text = widget.stok.stokId.toString();
      namabarangController.text = widget.stok.namabarang;
      hargabarangController.text = widget.stok.hargabarang.toString();
      stokbarangController.text = widget.stok.stokbarang.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final stokProvider = Provider.of<StokProvider>(context, listen: false);
        stokProvider.loadValues(widget.stok);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stokProvider = Provider.of<StokProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Stok')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: stokIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Stok Id'),
              onChanged: (value) {
                stokProvider.changestokId(value);
              },
            ),
            TextField(
              controller: namabarangController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Nama Barang'),
              onChanged: (value) {
                stokProvider.changenamabarang(value);
              },
            ),
            TextField(
              controller: hargabarangController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Harga Barang'),
              onChanged: (value) => stokProvider.changehargabarang(value),
            ),
            TextField(
              controller: stokbarangController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Stok Barang'),
              onChanged: (value) => stokProvider.changestokbarang(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                stokProvider.saveStok();
                Navigator.of(context).pop();
              },
            ),
            (widget.stok != null)
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Delete'),
                    onPressed: () {
                      stokProvider.removeStok(widget.stok.stokId);
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