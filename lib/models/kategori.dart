class Kategori {
  final String kategoriId;
  final String namakategori;
  final String deskripsi;


  Kategori({this.kategoriId,this.namakategori, this.deskripsi});

  Map<String, dynamic> toMap() {
    return {
      'kategoriId': kategoriId,
      'namakategori': namakategori,
      'deskripsi': deskripsi,
    };
  }

  Kategori.fromFirestore(Map<String, dynamic> firestore)
      : kategoriId = firestore['kategoriId'],
        namakategori = firestore['namakategori'],
        deskripsi = firestore['deskripsi'];
        
}
