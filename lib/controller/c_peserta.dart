import 'package:get/get.dart';
import 'package:project_kelas/model/peserta.dart';

class CPeserta extends GetxController {
  Rx<Peserta> _peserta = Peserta().obs;

  Peserta get user => _peserta.value;

  void setUser(Peserta dataPeserta) => _peserta.value = dataPeserta;
}
