part of 'providers.dart';

class AuthProvider with ChangeNotifier {
    final _credentials = GetStorage(myCred);
    bool _isLoading = false;

    bool get isLoading => _isLoading;

    void login(BuildContext context, String email, String password) async {
      _isLoading = true;
      
    }

    void logout() {
      _credentials.erase();
      Get.offAll(StartScreen());
    }
}