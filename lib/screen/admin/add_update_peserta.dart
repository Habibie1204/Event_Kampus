import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/screen/admin/add_update_panitia.dart';
import 'package:project_kelas/screen/admin/list_panitia.dart';
import 'package:project_kelas/widget/info.dart';

import '../../model/panitia.dart';

class AddUpdatePanitia extends StatefulWidget {
  final Panitia? panitia;
  AddUpdatePanitia({this.panitia});

  @override
  State<AddUpdatePanitia> createState() => _AddUpdatePanitiaState();
}

class _AddUpdatePanitiaState extends State<AddUpdatePanitia> {
  var _formKey = GlobalKey<FormState>();
  var _controllerNpm = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();
  var _controllerFakultas = TextEditingController();
  var _controllerProdi = TextEditingController();
  var _controllerPj_lomba = TextEditingController();

  bool _isHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.panitia != null) {
      _controllerNpm.text = widget.panitia!.mhsNpm!;
      _controllerNama.text = widget.panitia!.mhsNama!;
      _controllerAlamat.text = widget.panitia!.mhsAlamat!;
      _controllerFakultas.text = widget.panitia!.mhsFakultas!;
      _controllerProdi.text = widget.panitia!.mhsProdi!;
      _controllerPj_lomba.text = widget.panitia!.Pj_lomba!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.panitia != null
            ? Text('Update Panitia')
            : Text('Tambah Panitia'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.panitia == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNpm,
                  decoration: InputDecoration(
                      labelText: "NPM",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerAlamat,
                  decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerFakultas,
                  decoration: InputDecoration(
                      labelText: "Fakultas",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerProdi,
                  decoration: InputDecoration(
                      labelText: "Prodi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerPj_lomba,
                  decoration: InputDecoration(
                      labelText: "Pj Lomba",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.panitia == null) {
                        String message = await EventDb.AddPanitia(
                            _controllerNpm.text,
                            _controllerNama.text,
                            _controllerAlamat.text,
                            _controllerFakultas.text,
                            _controllerProdi.text,
                            _controllerPj_lomba.text);
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNpm.clear();
                          _controllerNama.clear();
                          _controllerAlamat.clear();
                          _controllerFakultas.clear();
                          _controllerProdi.clear();
                          _controllerPj_lomba.clear();
                          Get.off(
                            ListPanitia(),
                          );
                        }
                      } else {
                        EventDb.UpdatePanitia(
                            _controllerNpm.text,
                            _controllerNama.text,
                            _controllerAlamat.text,
                            _controllerFakultas.text,
                            _controllerProdi.text,
                            _controllerPj_lomba.text);
                      }
                    }
                  },
                  child: Text(
                    widget.panitia == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Asset.colorAccent,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
