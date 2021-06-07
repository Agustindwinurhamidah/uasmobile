class Stok {
  final String stokId;
  final String namabarang;
  final int hargabarang;
  final int stokbarang;

  Stok({this.stokId, this.namabarang, this.hargabarang, this.stokbarang});

  Map<String, dynamic> toMap() {
    return {
      'stokId': stokId,
      'namabarang': namabarang,
      'hargabarang': hargabarang,
      'stokbarang': stokbarang
    };
  }

  Stok.fromFirestore(Map<String, dynamic> firestore)
      : stokId = firestore['stokId'],
        namabarang = firestore['namabarang'],
        hargabarang = firestore['hargabarang'],
        stokbarang = firestore['stokbarang'];
}