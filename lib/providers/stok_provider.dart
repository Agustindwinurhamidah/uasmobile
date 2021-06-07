import 'package:flutter/material.dart';
import 'package:uasmobile/models/stok.dart';
import 'package:uasmobile/services/firestore_service.dart';
import 'package:uuid/uuid.dart';


class StokProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _stokId;
  String _namabarang;
  int _hargabarang;
  int _stokbarang;
  var uuid = Uuid();

  //Getters
  String get stokId => _stokId;
  String get namabarang => _namabarang;
  int get hargabarang => _hargabarang;
  int get stokbarang => _stokbarang;


  //Setters
  changestokId(String value) {
    _stokId =(value);
    notifyListeners();
  }

  changenamabarang(String value) {
    _namabarang = value;
    notifyListeners();
  }

  changehargabarang(String value) {
    _hargabarang = int.parse(value);
    notifyListeners();
  }
  changestokbarang(String value) {
    _stokbarang = int.parse(value);
    notifyListeners();
  }

  //read
  loadValues(Stok stok) {
    _stokId = stok.stokId;
    _namabarang = stok.namabarang;
    _hargabarang = stok.hargabarang;
    _stokbarang = stok.stokbarang;
  }

//create/update
  saveStok() {
    print(_stokId);
    if (_stokId == null) {
      var newStok = Stok(
          namabarang: namabarang,
          hargabarang: hargabarang,
          stokbarang: stokbarang,
          stokId: uuid.v4());
      firestoreService.saveStok(newStok);
    } else {
      //Update
      var updatedStok = Stok(
          stokId: stokId,
          namabarang: namabarang,
          hargabarang: hargabarang,
          stokbarang: stokbarang);
      firestoreService.saveStok(updatedStok);
    }
  }

//delete
  removeStok(String stokId) {
    firestoreService.removeStok(stokId);
  }
}
