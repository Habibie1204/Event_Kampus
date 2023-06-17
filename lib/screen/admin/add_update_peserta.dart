import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/screen/admin/list_peserta.dart';
import 'package:project_kelas/widget/info.dart';

import '../../model/peserta.dart';

class AddUpdatePeserta extends StatefulWidget {
  final Peserta? peserta;
  List<String> genders = [
    'Laki-laki',
    'Wanita',
  ];
  AddUpdatePeserta({this.peserta});

  @override
  State<AddUpdatePeserta> createState() => _AddUpdatePesertaState();
}

class _AddUpdatePesertaState extends State<AddUpdatePeserta> {
  final _formKey = GlobalKey<FormState>();
  final _controllernama = TextEditingController();
  final _controlleremail = TextEditingController();
  final _controllerasal_sekolah = TextEditingController();
  final _controllerdaftar_lomba = TextEditingController();
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    if (widget.peserta != null) {
      _controllernama.text = widget.peserta!.nama!;
      _controlleremail.text = widget.peserta!.email!;
      _controllerasal_sekolah.text = widget.peserta!.asal_sekolah!;
      _controllerdaftar_lomba.text = widget.peserta!.daftar_lomba!;
      _selectedGender = widget.peserta!.gender;
    }
  }

  @override
  void dispose() {
    _controllernama.dispose();
    _controlleremail.dispose();
    _controllerasal_sekolah.dispose();
    _controllerdaftar_lomba.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: widget.peserta != null
            ? Text('Update Peserta')
            : Text('Tambah Peserta'),
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
                  enabled: widget.peserta == null,
                  validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                  controller: _controllernama,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                  controller: _controlleremail,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                  controller: _controllerasal_sekolah,
                  decoration: InputDecoration(
                    labelText: "Asal Sekolah",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Jangan Kosong' : null,
                  controller: _controllerdaftar_lomba,
                  decoration: InputDecoration(
                    labelText: "Daftar Lomba",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  items: widget.genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.peserta == null) {
                        String message = await EventDb.AddPeserta(
                          _controllernama.text,
                          _controlleremail.text,
                          _controllerasal_sekolah.text,
                          _controllerdaftar_lomba.text,
                          _selectedGender!,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllernama.clear();
                          _controlleremail.clear();
                          _controllerasal_sekolah.clear();
                          _controllerdaftar_lomba.clear();
                          setState(() {
                            _selectedGender = null;
                          });
                          Get.off(ListPeserta());
                        }
                      } else {
                        EventDb.UpdatePeserta(
                          _controllernama.text,
                          _controlleremail.text,
                          _controllerasal_sekolah.text,
                          _controllerdaftar_lomba.text,
                          _selectedGender!,
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.peserta == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Asset.colorAccent,
                    fixedSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}