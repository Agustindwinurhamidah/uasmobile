import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uasmobile/models/kategori.dart';
import 'package:uasmobile/models/stok.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //siswa
  Future<void> saveStok(Stok stok) {
    return _db.collection('stoks').doc(stok.stokId).set(stok.toMap());
  }

  Stream<List<Stok>> getStoks() {
    return _db.collection('stoks').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Stok.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeStok(String Id) {
    return _db.collection('stoks').doc(Id).delete();
  }

  //mapel
  Future<void> saveKategori(Kategori kategori) {
    return _db.collection('kategoris').doc(kategori.kategoriId).set(kategori.toMap());
  }

  Stream<List<Kategori>> getKategoris() {
    return _db.collection('kategoris').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Kategori.fromFirestore(document.data()))
        .toList());
  }

 Future<void> removeKategori(String Id) {
    return _db.collection('kategoris').doc(Id).delete();
  }
}