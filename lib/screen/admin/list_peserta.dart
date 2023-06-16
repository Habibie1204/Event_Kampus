import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/model/peserta.dart';
// import 'package:project_kelas/screen/admin/add_update_panitia.dart';

class ListPeserta extends StatefulWidget {
  @override
  State<ListPeserta> createState() => _ListPesertaState();
}

class _ListPesertaState extends State<ListPeserta> {
  List<Peserta> _listPeserta = [];

  void getPeserta() async {
    _listPeserta = await EventDb.getPeserta();
    setState(() {});
  }

  @override
  void initState() {
    getPeserta();
    super.initState();
  }

  void showOption(Peserta? peserta) async {
    var result = await Get.dialog(
      AlertDialog(
        title: Text('Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    // switch (result) {
    //   case 'update':
    //     Get.to(AddUpdatePeserta(panitia: panitia))
    //         ?.then((value) => getPeserta());
    //     break;
    //   case 'delete':
    //     EventDb.deletePeserta(panitia!.mhsNpm!).then((value) => getPeserta());
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Peserta'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: _listPeserta.length > 0
          ? ListView.builder(
              itemCount: _listPeserta.length,
              itemBuilder: (context, index) {
                Peserta peserta = _listPeserta[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(peserta.nama ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(peserta.email ?? ''),
                        Text(peserta.asal_sekolah ??''), 
                        Text(peserta.daftar_lomba ??''),
                        Text(peserta.gender ??''),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () => showOption(peserta),
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text("Data Kosong"),
            ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>
      //       Get.to(AddUpdatePeserta())?.then((value) => getPeserta()),
      //   child: Icon(Icons.add),
      //   backgroundColor: Asset.colorAccent,
      // ),
    );
  }
}
