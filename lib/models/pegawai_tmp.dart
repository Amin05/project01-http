class Pegawai {
  List<Data> datas;

  Pegawai({required this.datas});

  @override
  String toString() {
    return '$datas';
  }

  factory Pegawai.fromJson(Map<String, dynamic> json) {
    return Pegawai(
        datas: List<Data>.from(json["data"].map((data) {
      return Data.fromJson(data);
    })));
  }

  // Map<String, dynamic> toJson() => {
  //       'nama': nama,
  //       'divisi': divisi,
  //       'gambar': gambar,
  //     };
}

class Data {
  String id, nama, divisi, gambar;
  Data(
      {required this.id,
      required this.nama,
      required this.divisi,
      required this.gambar});
  @override
  String toString() {
    return '{id: $id, nama: $nama, divisi: $divisi, gambar: $gambar}';
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        nama: json['nama'],
        divisi: json['divisi'],
        gambar: json['gambar']);
  }
}
