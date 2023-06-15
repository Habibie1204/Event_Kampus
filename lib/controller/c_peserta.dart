import 'package:get/get.dart';
import 'package:project_kelas/model/panitia.dart';

class CPanitia extends GetxController {
  Rx<Panitia> _panitia = Panitia().obs;

  Panitia get user => _panitia.value;

  void setUser(Panitia dataPanitia) => _panitia.value = dataPanitia;
}
