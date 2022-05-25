class PostinganModel {
  final String gambar;
  final String kategori;
  final String nama_barang;
  final String kondisi;
  final String harga;
  final String deskripsi;
  final List metodePembayaran;
  final String? pengguna;

  PostinganModel(
      {required this.kategori,
      this.pengguna,
      required this.gambar,
      required this.nama_barang,
      required this.kondisi,
      required this.harga,
      required this.deskripsi,
      required this.metodePembayaran});

  static PostinganModel fromJson(Map<String, dynamic> json) {
    return PostinganModel(
        gambar: json['gambar'],
        kategori: json['kategori'],
        nama_barang: json['nama_barang'],
        kondisi: json['kondisi'],
        harga: json['harga'],
        deskripsi: json['deskripsi'],
        metodePembayaran: json['metodePembayaran'],
        pengguna: json['pengguna']);
  }

  Map<String, dynamic> toJson() {
    List list = metodePembayaran.map((e) {
      if (e["value"] != false) {
        return e;
      }
    }).toList();

    // Remove null
    // var l = list.removeWhere((element) => element == null);

    return {
      "image": gambar,
      "category": kategori,
      "title": nama_barang,
      "conditions": kondisi,
      "price": harga,
      "description": deskripsi,
      "dealMethod": list,
      "user" : pengguna
    };
  }
}
