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
    }
    // print(response);
    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _credentials.erase();
    Get.offAll(StartScreen());
  }

  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    var pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _pictureFile = File(pickedImage.path);
      notifyListeners();
    }
  }

  String? errorCheck(String email, String password) {
    if (email.length < 1 || password.length < 1) {
      return 'Email dan password tidak boleh kosong';
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return 'Email tidak valid';
    }
    return null;
  }
}
