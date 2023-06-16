class Api {
  static const _host = "http://192.168.43.181:8080/api_kelas";

  static String _user = "$_host/user";
  static String _panitia = "$_host/panitia";
  static String _peserta = "$_host/peserta";

  static String login = "$_host/login.php";
  static String signup = "$_host/register.php";


  // user
  static String addUser = "$_user/add_user.php";
  static String deleteUser = "$_user/delete_user.php";
  static String getUsers = "$_user/get_users.php";
  static String updateUser = "$_user/update_user.php";

  // panitia
  static String addPanitia = "$_panitia/add_panitia.php";
  static String deletePanitia = "$_panitia/delete_panitia.php";
  static String getPanitia = "$_panitia/get_panitia.php";
  static String updatePanitia = "$_panitia/update_panitia.php";

  // peserta
  static String addPeserta = "$_peserta/add_peserta.php";
  static String deletePeserta = "$_peserta/delete_peserta.php";
  static String getPeserta = "$_peserta/get_peserta.php";
  static String updatePeserta = "$_peserta/add_update_peserta.php";
}
