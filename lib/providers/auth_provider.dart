part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  final _credentials = GetStorage(myCredPref);

  File? _pictureFile;
  bool _isLoading = false;
  AuthServices authServices = AuthServices();

  File? get pictureFile => _pictureFile;
  bool get isLoading => _isLoading;

  void login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    var errorMessage = errorCheck(email, password);

    if (errorMessage != null) {
      WidgetHelpers.snackbar(context, SnackbarType.warning,
          title: 'Perhatian!', message: errorMessage.toString());
      _isLoading = false;
      return;
    }

    dio.FormData data = dio.FormData.fromMap({
      'email': email,
      'password': password,
    });

    var response = await authServices.login(context, data);
    if (response?.data != null) {
      print('success');
      // SAVE CREDENTIALS
      if (response?.data?.accessToken != null) {
        _credentials.write(authKey, response?.data?.accessToken);
        _pictureFile = null;
        Get.offAll(() => HomeScreen());
      }
    }
    // _credentials.write(authKey, 'testing');
    // Get.offAll(() => HomeScreen());
    // print(response);
    _isLoading = false;
    notifyListeners();
  }

  void register(
    BuildContext context, {
    @required String? email,
    @required String? nama,
    @required String? jk,
    @required String? tglLahir,
    @required String? noHP,
    @required String? alamat,
    @required String? password,
  }) async {
    String? errorMessage = registerValidator(
        nama!, email!, jk, tglLahir, noHP!, alamat!, password!);

    if (errorMessage != null) {
      WidgetHelpers.snackbar(context, SnackbarType.warning,
          title: 'Perhatian!', message: errorMessage.toString());
      _isLoading = false;
      return;
    }

    WidgetHelpers.showConfirmDialog(context,
        title: 'Konfirmasi Pendaftaran',
        message: 'Anda yakin ingin mendaftar?',
        confirmText: 'Konfirmasi',
        onCancel: () {
          Get.back();
        },
        cancelText: 'Batal',
        onConfirm: () async {
          _isLoading = true;
          notifyListeners();
          Get.back();
          print(_pictureFile);
          dio.FormData data = dio.FormData.fromMap(
            {
              'name': nama,
              'email': email,
              'password': password,
              'alamat': alamat,
              'tgl_lahir': tglLahir,
              'no_hp': noHP,
              'jenis_kelamin': jk,
              'url_foto': _pictureFile == null
                  ? null
                  : await dio.MultipartFile.fromFile(_pictureFile!.path,
                      filename: _pictureFile?.path.split('/').last),
            },
          );

          var response = await authServices.register(context, data);
          if (response?.data != null) {
            print('success');
            // SAVE CREDENTIALS
            if (response?.data?.accessToken != null) {
              _credentials.write(authKey, response?.data?.accessToken);
              _pictureFile = null;
              Get.offAll(() => HomeScreen());
            }
          }
          _isLoading = false;
          notifyListeners();
        });
  }

  String? registerValidator(
    String nama,
    String email,
    String? jk,
    String? tglLahir,
    String noHP,
    String alamat,
    String password,
  ) {
    if (nama.length < 1 ||
        email.length < 1 ||
        jk == null ||
        tglLahir == null ||
        noHP.length < 1 ||
        alamat.length < 1 ||
        password.length < 1) {
      return 'Mohon untuk mengisi seluruh data';
    }
    if (!_isEmailValid(email)) {
      return 'Email yang anda masukkan tidak valid';
    }
    if (!_isPhoneNumberValid(noHP)) {
      return 'Nomor handphone yang anda masukkan tidak valid';
    }
    if (password.length < 8) {
      return 'Password harus lebih dari 8 karakter';
    }
    return null;
  }

  String? updateValidator(
    String nama,
    String email,
    String? jk,
    String? tglLahir,
    String noHP,
    String alamat,
  ) {
    if (nama.length < 1 ||
        email.length < 1 ||
        jk == null ||
        tglLahir == null ||
        noHP.length < 1 ||
        alamat.length < 1) {
      return 'Mohon untuk mengisi seluruh data';
    }
    if (!_isEmailValid(email)) {
      return 'Email yang anda masukkan tidak valid';
    }
    if (!_isPhoneNumberValid(noHP)) {
      return 'Nomor handphone yang anda masukkan tidak valid';
    }
    return null;
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

  String? errorCheck(String email, String password) {
    if (email.length < 1 || password.length < 1) {
      return 'Email dan password tidak boleh kosong';
    }
    if (!_isEmailValid(email)) {
      return 'Email tidak valid';
    }
    return null;
  }

  void updateProfile(
    BuildContext context, {
    required String nama,
    required String email,
    required String jenisKelamin,
    required String tglLahir,
    required String noHp,
    required String alamat,
  }) async {
    String? errorMessage =
        updateValidator(nama, email, jenisKelamin, tglLahir, noHp, alamat);
    if (errorMessage != null) {
      WidgetHelpers.snackbar(context, SnackbarType.warning,
          title: 'Perhatian!', message: errorMessage.toString());
      _isLoading = false;
      return;
    }

    _isLoading = true;
    notifyListeners();

    dio.FormData data = dio.FormData.fromMap({
      'name': nama,
      'email': email,
      'alamat': alamat,
      'tgl_lahir': tglLahir,
      'no_hp': noHp,
      'jenis_kelamin': jenisKelamin,
      'url_foto': _pictureFile == null
          ? null
          : await dio.MultipartFile.fromFile(_pictureFile!.path,
              filename: _pictureFile?.path.split('/').last),
    });

    var response = await authServices.updateUser(context, data);

    if (response != null) {
      _pictureFile = null;
      Get.back();
      Get.back();
      WidgetHelpers.snackbar(context, SnackbarType.success,
          title: 'Perhatian!', message: 'Profile berhasil diupdate!');
      //update setting user
      UserModel user = UserModel.fromJson(response['data']['user']);
      Provider.of<SettingsProvider>(context, listen: false).setUser(user);
    }
    _isLoading = false;
    notifyListeners();
  }

  bool _isEmailValid(String email) {
    // Cek apakah email sudah sesuai : email
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isPhoneNumberValid(String noHp) {
    return noHp.length >= 10 && noHp.length < 14;
  }

  void logout(BuildContext context) {
    _credentials.erase();
    _pictureFile = null;
    Provider.of<SettingsProvider>(context, listen: false).clearAll();
    Get.offAll(StartScreen());
  }
}
