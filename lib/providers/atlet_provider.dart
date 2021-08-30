part of 'providers.dart';

class AtletProvider extends ChangeNotifier {
  Atlet? atlet;

  List<Kelas>? _classes;
  List<Kelas>? get classes => _classes;

  List<Kelas>? _filteredClasses;
  List<Kelas>? get filteredClasses => _filteredClasses;

  List<Kategori>? _categories;
  List<Kategori>? get categories => _categories;

  Kategori? selectedKategori;
  Kelas? selectedKelas;

  ClubServices _clubServices = ClubServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void onSelectCategory(Kategori val) {
    selectedKategori = val;
    selectedKelas = null;

    _filteredClasses = _classes
            ?.where((element) =>
                element.kategoriId == val.id &&
                (element.jenisKelamin == atlet!.user!.jenisKelamin ||
                    element.jenisKelamin == null))
            .toList() ??
        [];

    notifyListeners();
  }

  void resetAll() {
    atlet = null;
    selectedKategori = null;
    selectedKelas = null;
  }

  void onSelectClass(Kelas val) {
    selectedKelas = val;
    notifyListeners();
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
        notifyListeners();
      }
    }
  }

  void updateAtlet(BuildContext context) async {
    if (selectedKategori == null && selectedKelas == null) {
      WidgetHelpers.snackbar(context, SnackbarType.error,
          title: 'Gagal menyimpan perubahan',
          message: 'Mohon untuk memilih kategori dan kelas atlet');
      return;
    }
    _isLoading = true;
    notifyListeners();
    dio.FormData data = dio.FormData.fromMap({
      'id': atlet!.id,
      'category_id': selectedKategori!.id,
      'class_id': selectedKelas!.id,
    });

    var response = await _clubServices.updateAtlet(context, data);

    if (response != null) {
      Get.back();
      Get.back();
      WidgetHelpers.snackbar(context, SnackbarType.success,
          title: 'Perhatian!', message: 'Atlet berhasil diubah!');
    }
    _isLoading = false;
    notifyListeners();
  }
}
