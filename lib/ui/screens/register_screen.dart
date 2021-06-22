part of 'screens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _namaController = TextEditingController();
    var _emailController = TextEditingController();
    var _noHpController = TextEditingController();
    var _alamatController = TextEditingController();

    return GeneralScreen(
      title: 'Register',
      subtitle: 'Lengkapi semua data untuk mendaftar',
      onBackButtonPressed: () {
        Get.back();
      },
      bottomNavigationBar: GradientRoundedButton(
        child: Text(
          'Berikutnya',
          style: normalLight1,
        ),
        onPressed: () {
          FocusScope.of(context).unfocus();
        },
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              RoundedInputField(
                hintText: "Nama Lengkap Anda",
                controller: _namaController,
                icon: Icons.person,
              ),
              RoundedInputField(
                hintText: "Alamat Email Anda",
                controller: _emailController,
                icon: Icons.mail,
                textInputType: TextInputType.emailAddress,
              ),
              RoundedInputField(
                hintText: "Nomor Handphone Anda",
                controller: _noHpController,
                icon: Icons.phone,
                textInputType: TextInputType.phone,
              ),
              RoundedInputField(
                hintText: "Alamat Lengkap Anda",
                controller: _alamatController,
                icon: Icons.location_on,
              ),
              SizedBox(height: defaultMargin * 2),
            ],
          ),
        ),
      ),
    );
  }
}
