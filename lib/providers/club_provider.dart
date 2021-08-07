part of 'providers.dart';

class ClubProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  List<Atlet>? _athletes;
  List<Atlet>? get athletes => _athletes;

  ClubServices _clubServices = ClubServices();

  void getNotifCount(BuildContext context, String clubId) async {
    var param = {
      'club_id': clubId,
    };
    var response = await _clubServices.getNotifCount(context, param);

    if (response != null) {
      _count = response;
      notifyListeners();
    }
  }

  void getAllAtlet(BuildContext context, String clubId) async {
    var param = {
      'club_id': clubId,
    };
    var response = await _clubServices.getAthletes(context, param);

    if (response != null) {
      _athletes = List<Atlet>.from(
          response['data']['athletes'].map((x) => Atlet.fromJson(x)));
      notifyListeners();
    }
  }
}
