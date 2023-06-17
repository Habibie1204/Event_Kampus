import 'package:get/get.dart';
import 'package:project_kelas/model/jadwal.dart';

class CPanitia extends GetxController {
  Rx<Jadwal> _jadwal = Jadwal().obs;

  Jadwal get user => _jadwal.value;

  void setUser(Jadwal dataJadwal) => _jadwal.value = dataJadwal;
}
