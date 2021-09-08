part of 'providers.dart';

class ClubProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  List<Atlet>? _athletes;
  List<Atlet>? get athletes => _athletes;

  List<Atlet>? _filteredAthletes;
  List<Atlet>? get filteredAthletes => _filteredAthletes;

  ClubServices _clubServices = ClubServices();

  File? _pictureFile;
  File? get pictureFile => _pictureFile;

  List<Kelas>? _classes;
  List<Kelas>? get classes => _classes;

  List<Kelas>? _filteredClasses;
  List<Kelas>? get filteredClasses => _filteredClasses;

  List<Kategori>? _categories;
  List<Kategori>? get categories => _categories;

  Kategori? _selectedKategori;
  Kategori? get selectedKategori => _selectedKategori;

  Kelas? _selectedKelas;
  Kelas? get selectedKelas => _selectedKelas;

  String? _jenisKelamin;
  String? get jenisKelamin => _jenisKelamin;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void onSelectSex(String val) {
    _jenisKelamin = val;
    _selectedKelas = null;
    _filteredClasses = _classes;
    if (_selectedKategori != null) {
      _filteredClasses = _classes
              ?.where((element) =>
                  element.kategoriId == _selectedKategori!.id &&
                  (element.jenisKelamin == _jenisKelamin ||
                      element.jenisKelamin == null))
              .toList() ??
          [];
    } else {
      _filteredClasses = _classes
              ?.where((element) =>
                  element.jenisKelamin == val || element.jenisKelamin == null)
              .toList() ??
          [];
    }
    notifyListeners();
  }

  void onSelectCategory(Kategori val) {
    _selectedKategori = val;
    _selectedKelas = null;
    if (_jenisKelamin != null) {
      _filteredClasses = _classes
              ?.where((element) =>
                  element.kategoriId == val.id &&
                  (element.jenisKelamin == _jenisKelamin ||
                      element.jenisKelamin == null))
              .toList() ??
          [];
    } else {
      _filteredClasses =
          _classes?.where((element) => element.kategoriId == val.id).toList() ??
              [];
    }
    notifyListeners();
  }

  void onSelectClass(Kelas val) {
    _selectedKelas = val;
    notifyListeners();
  }

  void resetFilter(bool isInit) {
    _selectedKategori = null;
    _selectedKelas = null;
    _jenisKelamin = null;
    _filteredAthletes = _athletes;

    if (!isInit) notifyListeners();
    // notifyListeners();
  }

  void doFilter({String nama = ''}) {
    if (_athletes != null) {
      _filteredAthletes = _athletes;
    } else {
      _filteredAthletes = [];
    }

    if (nama.isNotEmpty) {
      _filteredAthletes = _athletes
          ?.where((element) =>
              element.user!.name!.toLowerCase().contains(nama.toLowerCase()))
          .toList();
    }

    if (_selectedKategori != null) {
      _filteredAthletes = _filteredAthletes
          ?.where((element) => element.kategori == null
              ? false
              : element.kategori!.nama == _selectedKategori!.nama)
          .toList();
    }

    if (_jenisKelamin != null) {
      _filteredAthletes = _filteredAthletes
          ?.where((element) => element.user!.jenisKelamin == _jenisKelamin!)
          .toList();
    }

    if (_selectedKelas != null) {
      _filteredAthletes = _filteredAthletes
          ?.where((element) => element.kelas == null
              ? false
              : element.kelas!.nama == _selectedKelas!.nama)
          .toList();
    }

    print(_filteredAthletes);

    notifyListeners();
    // _filteredAthletes = _athletes?.where((element) {
    //       if (nama.isNotEmpty) {
    //       )
    //       }
    //       return false;
    //       // if (_selectedKelas != null) {
    //       //   if (_jenisKelamin != null) {
    //       //     return element.user?.jenisKelamin == _jenisKelamin &&
    //       //         element.kelas?.nama == _selectedKelas!.nama &&
    //       //         element.kategori?.nama == _selectedKategori!.nama;
    //       //   }
    //       //   return element.kelas?.nama == _selectedKelas!.nama;
    //       // }
    //       // return true;
    //     }).toList() ??
    //     [];
  }

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

  void initAthleteSettings(BuildContext context) async {
    var response = await _clubServices.getAthleteSettings(context);
    if (response != null) {
      if (response['data'] != null) {
        _classes = List<Kelas>.from(
            response['data']['classes'].map((x) => Kelas.fromJson(x)));
        _categories = List<Kategori>.from(
            response['data']['categories'].map((x) => Kategori.fromJson(x)));
        _filteredClasses = _classes;
      }
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
      _filteredAthletes = _athletes;
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

  void updateAtlet(Atlet atlet) {
    _athletes!.removeWhere((element) => element.id == atlet.id);
    _athletes!.add(atlet);
    _filteredAthletes = _athletes;
    notifyListeners();
  }

  void updateRecordCount(String id, int count) {
    Atlet atlet = _filteredAthletes!.firstWhere((element) => element.id == id);
    atlet.recordCount = count;
    notifyListeners();
  }
}
