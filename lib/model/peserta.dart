class Panitia {
  String? mhsNpm;
  String? mhsNama;
  String? mhsAlamat;
  String? mhsFakultas;
  String? mhsProdi;
  String? Pj_lomba;

  Panitia({
    this.mhsNpm,
    this.mhsNama,
    this.mhsAlamat,
    this.mhsFakultas,
    this.mhsProdi,
    this.Pj_lomba,
  });

  factory Panitia.fromJson(Map<String, dynamic> json) => Panitia(
        mhsNpm: json['mhsNpm'],
        mhsNama: json['mhsNama'],
        mhsAlamat: json['mhsAlamat'],
        mhsFakultas: json['mhsFakultas'],
        mhsProdi: json['mhsProdi'],
        Pj_lomba: json['pj_lomba'],
      );

  Map<String, dynamic> toJson() => {
        'mhsNpm': this.mhsNpm,
        'mhsNama': this.mhsNama,
        'mhsAlamat': this.mhsAlamat,
        'mhsFakultas': this.mhsFakultas,
        'mhsProdi': this.mhsProdi,
        'pj_lomba': this.Pj_lomba,
      };
}
