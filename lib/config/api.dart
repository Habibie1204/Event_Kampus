class Api {
  static const _host = "http://192.168.43.175/api_kelas";

  static String _user = "$_host/user";
  static String _panitia = "$_host/panitia";

  static String login = "$_host/login.php";

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

  // panitia
  static String addPeserta = "$_panitia/add_panitia.php";
  static String deletePeserta = "$_panitia/delete_panitia.php";
  static String getPeserta = "$_panitia/get_panitia.php";
  static String updatePeserta = "$_panitia/update_panitia.php";
}
