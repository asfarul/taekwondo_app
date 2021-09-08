part of 'providers.dart';

class RecordProvider extends ChangeNotifier {
  List<Record>? _records;
  List<Record>? get records => _records;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ClubServices _clubServices = ClubServices();

  void getAthleteRecords(BuildContext context, String id) async {
    _records = [];
    var response = await _clubServices.getAthleteRecords(context, id);
    if (response != null) {
      if (response['data'] != null) {
        _records = List<Record>.from(
            response['data']['records'].map((x) => Record.fromJson(x)));
        print(_records);
      }
    }
    notifyListeners();
  }

  void addRecord(BuildContext context, dio.FormData data, String id) async {
    _isLoading = true;
    notifyListeners();
    var response = await _clubServices.addRecord(context, data);
    if (response != null) {
      print(response['data']['record']);
      Record record = Record.fromJson(response['data']['record']);
      _records?.insert(0, record);
      Get.back();
      WidgetHelpers.snackbar(context, SnackbarType.success,
          title: 'Berhasil!', message: 'Record berhasil ditambah!');
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<ClubProvider>(context, listen: false)
        .updateRecordCount(id, _records!.length);
  }

  void deleteRecord(
      BuildContext context, String recordId, String atletId) async {
    WidgetHelpers.showConfirmDialog(
      context,
      title: 'Hapus Record?',
      message: 'Anda yakin ingin menghapus record?',
      onConfirm: () async {
        _isLoading = true;
        notifyListeners();
        dio.FormData data = dio.FormData.fromMap({
          'record_id': recordId,
        });
        var response = await _clubServices.deleteRecord(context, data);
        if (response != null) {
          Get.back();
          _records!.removeWhere((element) => element.id == recordId);
          WidgetHelpers.snackbar(context, SnackbarType.success,
              title: 'Sukses', message: 'Record berhasil dihapus');
          Provider.of<ClubProvider>(context, listen: false)
              .updateRecordCount(atletId, _records!.length);
        }

        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
