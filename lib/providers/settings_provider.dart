part of 'providers.dart';

class SettingsProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  ClubModel? _myClub;
  ClubModel? get myClub => _myClub;

  String _clubStatus = '';
  String get clubStatus => _clubStatus;

  dynamic _clubInfo;
  dynamic get clubInfo => _clubInfo;

  List<BeritaModel> _berita = [];
  List<BeritaModel> get berita => _berita;

  String? _kategori;
  String? get kategori => _kategori;

  String? _role;
  String? get role => _role;

  SettingServices _settingServices = SettingServices();

  void initSettings(BuildContext context) async {
    var response = await _settingServices.getSettingsData(context);
    if (response != null) {
      if (response['data'] != null) {
        _user = UserModel.fromJson(response['data']['user']);
        _berita = List<BeritaModel>.from(
            response['data']['berita'].map((x) => BeritaModel.fromJson(x)));
        _clubStatus = response['data']['statusClub'] as String;
        _kategori = response['data']['kategori'];
        _role = response['data']['roleClub'];
        _myClub = response['data']['club'] == null
            ? null
            : ClubModel.fromJson(response['data']['club']);
      }
    } else {
      _clubStatus = error;
    }
    notifyListeners();
  }

  void setAfterJoin(ClubModel? club) {
    _clubStatus = melamar;
    _myClub = club;
    notifyListeners();
  }
}
