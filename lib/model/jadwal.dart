import 'dart:typed_data';

class Jadwal {
  Uint8List? gambar;
  String? namaLomba;
  String? lokasi;
  DateTime? jadwal;
  String? namaPJ;
  String? deskripsi;

  Jadwal({
    this.gambar,
    this.namaLomba,
    this.lokasi,
    this.jadwal,
    this.namaPJ,
    this.deskripsi,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        gambar: json['gambar'],
        namaLomba: json['nama_lomba'],
        lokasi: json['lokasi'],
        jadwal: DateTime.parse(json['jadwal']),
        namaPJ: json['nama_pj'],
        deskripsi: json['deskripsi'],
      );

  Map<String, dynamic> toJson() => {
        'gambar': this.gambar,
        'nama_lomba': this.namaLomba,
        'lokasi': this.lokasi,
        'jadwal': this.jadwal?.toIso8601String(),
        'nama_pj': this.namaPJ,
        'deskripsi': this.deskripsi,
      };
}
