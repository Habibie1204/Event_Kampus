class Api {
  static const _host = "http://192.168.3.57:74/api_project_kelas";

  static String _user = "$_host/user";
  static String _mahasiswa = "$_host/mahasiswa";

  static String login = "$_host/login.php";

  // user
  static String addUser = "$_user/add_user.php";
  static String deleteUser = "$_user/delete_user.php";
  static String getUsers = "$_user/get_users.php";
  static String updateUser = "$_user/update_user.php";

  // mahasiswa
  static String addMahasiswa = "$_mahasiswa/add_mahasiswa.php";
  static String deleteMahasiswa = "$_mahasiswa/delete_mahasiswa.php";
  static String getMahasiswa = "$_mahasiswa/get_mahasiswa.php";
  static String updateMahasiswa = "$_mahasiswa/update_mahasiswa.php";
}
