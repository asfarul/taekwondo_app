part of 'providers.dart';

class SettingsProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  String _clubStatus = '';
  String get clubStatus => _clubStatus;

  dynamic _clubInfo;
  dynamic get clubInfo => _clubInfo;

  AuthServices _auth = AuthServices();

  void initSettings(BuildContext context) async {
    var response = await _auth.getUser(context);
    if (response != null) {
      if (response['data'] != null) {
        _user = UserModel.fromJson(response['data']['user']);
      }
    }
    _clubStatus = 'BERGABUNG';
    notifyListeners();
  }
}
