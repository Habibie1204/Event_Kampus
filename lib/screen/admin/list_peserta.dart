import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/model/panitia.dart';
import 'package:project_kelas/screen/admin/add_update_panitia.dart';

class ListPanitia extends StatefulWidget {
  @override
  State<ListPanitia> createState() => _ListPanitiaState();
}

class _ListPanitiaState extends State<ListPanitia> {
  List<Panitia> _listPanitia = [];

  void getPanitia() async {
    _listPanitia = await EventDb.getPanitia();
    setState(() {});
  }

  @override
  void initState() {
    getPanitia();
    super.initState();
  }

  void showOption(Panitia? panitia) async {
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

    switch (result) {
      case 'update':
        Get.to(AddUpdatePanitia(panitia: panitia))
            ?.then((value) => getPanitia());
        break;
      case 'delete':
        EventDb.deletePanitia(panitia!.mhsNpm!).then((value) => getPanitia());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Panitia'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: _listPanitia.length > 0
          ? ListView.builder(
              itemCount: _listPanitia.length,
              itemBuilder: (context, index) {
                Panitia panitia = _listPanitia[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(panitia.mhsNama ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(panitia.mhsNpm ?? ''),
                        Text(panitia.Pj_lomba ??
                            ''), // Menampilkan field panitia
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () => showOption(panitia),
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text("Data Kosong"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.to(AddUpdatePanitia())?.then((value) => getPanitia()),
        child: Icon(Icons.add),
        backgroundColor: Asset.colorAccent,
      ),
    );
  }
}
