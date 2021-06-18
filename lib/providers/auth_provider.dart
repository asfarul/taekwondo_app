part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  final _credentials = GetStorage(myCred);
  bool _isLoading = false;
  AuthServices authServices = AuthServices();

  bool get isLoading => _isLoading;

  void login(BuildContext context, String email, String password) async {
    _isLoading = true;
    dio.FormData data = dio.FormData.fromMap({
      'email': email,
      'password': password,
    });

    var errorMessage = errorCheck(email, password);

    if (errorMessage != null) {
      WidgetHelpers.snackbar(context, SnackbarType.warning,
          title: 'Perhatian!', message: errorMessage.toString());
      _isLoading = false;
      return;
    }
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
