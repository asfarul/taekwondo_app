part of 'providers.dart';

class SettingsProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  String _clubStatus = '';
  String get clubStatus => _clubStatus;

  dynamic _clubInfo;
  dynamic get clubInfo => _clubInfo;

  List<BeritaModel> _berita = [];
  List<BeritaModel> get berita => _berita;

  SettingServices _settingServices = SettingServices();

  void initSettings(BuildContext context) async {
    var response = await _settingServices.getSettingsData(context);
    if (response != null) {
      if (response['data'] != null) {
        _user = UserModel.fromJson(response['data']['user']);
        _berita = List<BeritaModel>.from(
            response['data']['berita'].map((x) => BeritaModel.fromJson(x)));
        _clubStatus = response['data']['statusClub'] as String;
      }
    }
    _clubStatus = 'KOSONG';
    notifyListeners();
  }
}
