part of 'providers.dart';

class ClubProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

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

  void getAllAtlet(BuildContext context, String clubId) async {}
}
