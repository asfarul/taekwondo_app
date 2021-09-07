part of 'widgets.dart';

class RecordList extends StatelessWidget {
  final bool isPelatih;
  final Atlet atlet;

  RecordList(this.isPelatih, this.atlet);
  @override
  Widget build(BuildContext context) {
    var recProv = Provider.of<RecordProvider>(context, listen: false);
    recProv.getAthleteRecords(context, atlet.id!);
    var _namaController = TextEditingController();
    var _tingkatController = TextEditingController();
    var _peringkatController = TextEditingController();
    var _tglMulai = null;
    var _tglAkhir = null;

    void onSelectDateAwal(String val) {
      _tglMulai = val;
    }

    void onSelectDateAkhir(String val) {
      _tglAkhir = val;
    }

    _showDialog() async {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Tambah Riwayat Kompetisi'),
            contentPadding: const EdgeInsets.all(16.0),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundedInputField(
                    hintText: 'Nama Kompetisi',
                    controller: _namaController,
                    icon: Icons.bookmark,
                  ),
                  RoundedInputField(
                    hintText: 'Tingkat Kompetisi',
                    controller: _tingkatController,
                    icon: Icons.sort,
                  ),
                  RoundedDateInput(
                      onSelectDateAwal, null, 'Tanggal Dimulai', false),
                  RoundedDateInput(
                      onSelectDateAkhir, null, 'Tanggal Berakhir', false),
                  RoundedInputField(
                    hintText: 'Peringkat/medali yg diraih',
                    controller: _namaController,
                    icon: Icons.star,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Flexible(
                    child: DialogButton(
                      child: Text(
                        'Cancel',
                        style: normalLight1,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      color: grey,
                    ),
                  ),
                  Flexible(
                    child: DialogButton(
                      child: Text(
                        'Tambah',
                        style: normalLight1,
                      ),
                      onPressed: () {
                        var data = dio.FormData.fromMap(
                          {
                            'athlete_id': atlet.id,
                            'nama': _namaController.text,
                            'tingkat': _tingkatController.text,
                            'peringkat': _peringkatController.text,
                            'tanggal_dimulai': _tglMulai,
                            'tanggal_berakhir': _tglAkhir,
                          },
                        );

                        recProv.addRecord(context, data);
                        Get.back();
                      },
                      gradient: LinearGradient(
                          colors: [primaryColor, midColor, secondaryColor],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<RecordProvider>(
                  builder: (context, prov, chid) => Text(
                    'Riwayat Kompetisi (${prov.records?.length ?? '0'})',
                    style: normalDark2,
                  ),
                ),
                GestureDetector(
                  onTap: _showDialog,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Consumer<RecordProvider>(builder: (context, prov, child) {
            // if (prov.records == null) {
            //   prov.getAthleteRecords(context, atlet.id!);
            // }

            if (prov.records != null) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: prov.records!.length,
                itemBuilder: (context, index) {
                  var item = prov.records![index];
                  return ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      color: primaryColor,
                      size: 40,
                    ),
                    title: Text(
                      item.nama ?? '-',
                      style: normalDark2,
                    ),
                    subtitle: Text(
                      '${item.tglMulai != null ? DateFormat('d/M/yyyy').format(item.tglMulai!) : ''} - ${item.tglAkhir != null ? DateFormat('d/M/yyyy').format(item.tglAkhir!) : ''} | Peringkat/Medali : ${item.peringkat ?? '-'}',
                      style: smallDark1,
                    ),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          })
        ],
      ),
    );
  }
}
