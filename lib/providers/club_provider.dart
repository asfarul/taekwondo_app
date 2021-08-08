part of 'providers.dart';

class ClubProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  List<Atlet>? _athletes;
  List<Atlet>? get athletes => _athletes;

  ClubServices _clubServices = ClubServices();

  File? _pictureFile;
  File? get pictureFile => _pictureFile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    var pickedImage =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedImage != null) {
      _pictureFile = File(pickedImage.path);
      notifyListeners();
    }
  }

  void updateClub(
    BuildContext context, {
    required String clubId,
    required String nama,
    required String alamat,
    required String deskripsi,
  }) async {
    if (nama.length < 1 || alamat.length < 1 || deskripsi.length < 1) {
      WidgetHelpers.snackbar(context, SnackbarType.warning,
          title: 'Perhatian!', message: 'Data tidak boleh kosong!');
      return;
    }

    _isLoading = true;
    notifyListeners();

    dio.FormData data = dio.FormData.fromMap({
      'club_id': clubId,
      'nama': nama,
      'deskripsi': deskripsi,
      'alamat': alamat,
      if (_pictureFile != null)
        'url_foto': await dio.MultipartFile.fromFile(_pictureFile!.path,
            filename: _pictureFile?.path.split('/').last)
    });

    var response = await _clubServices.updateClub(context, data);

    if (response != null) {
      _pictureFile = null;
      Get.back();
      WidgetHelpers.snackbar(context, SnackbarType.success,
          title: 'Perhatian!', message: 'Club berhasil diupdate!');
      ClubModel club = ClubModel.fromJson(response['data']['club']);
      Provider.of<SettingsProvider>(context, listen: false).setClub(club);
    }
    _isLoading = false;
    notifyListeners();
  }
}
