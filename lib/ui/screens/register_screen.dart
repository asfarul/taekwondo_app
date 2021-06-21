part of 'screens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralScreen(
      title: 'Register',
      subtitle: 'Lengkapi semua data untuk mendaftar',
      onBackButtonPressed: () {
        Get.back();
      },
    );
  }
}
