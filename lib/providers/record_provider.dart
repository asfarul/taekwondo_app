part of 'providers.dart';

class RecordProvider extends ChangeNotifier {
  List<Record>? _records;
  List<Record>? get records => _records;

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

  void addRecord(BuildContext context, dio.FormData data) async {}
}
