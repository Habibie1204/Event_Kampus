class Peserta {
  String? nama;
  String? email;
  String? asal_sekolah;
  String? daftar_lomba;
  String? gender;

  Peserta({
    this.nama,
    this.email,
    this.asal_sekolah,
    this.daftar_lomba,
    this.gender,
  });

  factory Peserta.fromJson(Map<String, dynamic> json) => Peserta(
        nama: json['nama'],
        email: json['email'],
        asal_sekolah: json['asal sekolah'],
        daftar_lomba: json['daftar lomba'],
        gender: json['gender'],
      );

  Map<String, dynamic> toJson() => {
        'nama': this.nama,
        'email': this.email,
        'asal_sekolah': this.asal_sekolah,
        'daftar_lomba': this.daftar_lomba,
        'gender': this.gender,
      };
}
