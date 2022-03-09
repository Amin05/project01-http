// class Pegawai {
//   String id, nama, divisi, gambar;

//   Pegawai({required this.id, required this.nama, required this.divisi, required this.gambar});

//   factory Pegawai.fromJson(Map<String, dynamic> json) {
//     return Pegawai(
//       id: json['id'] as String,
//       nama: json['nama'] as String,
//       divisi: json['divisi'] as String,
//       gambar: json['gambar'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'nama': nama,
//     'divisi': divisi,
//     'gambar': gambar,
//   };
// }

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
