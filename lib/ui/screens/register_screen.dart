part of 'screens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _namaController = TextEditingController();
    TextEditingController _alamatController = TextEditingController();
    TextEditingController _noHPController = TextEditingController();
    String? _tglLahir;
    String? _jenisKelamin;

    void onSelectDate(String val) {
      _tglLahir = val;
    }

    void onSelectSex(String val) {
      _jenisKelamin = val;
    }

    return GeneralScreen(
      title: 'Register',
      subtitle: 'Lengkapi semua data untuk mendaftar',
      onBackButtonPressed: () {
        Get.back();
      },
      bottomNavigationBar: GradientRoundedButton(
        child: Text(
          'Daftar',
          style: normalLight1,
        ),
        onPressed: () {
          authProvider.register(context,
              email: _emailController.text,
              nama: _namaController.text,
              jk: _jenisKelamin,
              tglLahir: _tglLahir,
              noHP: _noHPController.text,
              alamat: _alamatController.text,
              password: _passwordController.text);
        },
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  Provider.of<AuthProvider>(context, listen: false)
                      .pickImage(context);
                },
                child: Container(
                  width: 110,
                  height: 110,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/photo_border.png'),
                    ),
                  ),
                  child: Consumer<AuthProvider>(
                    builder: (context, value, _) {
                      if (value.pictureFile != null) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(value.pictureFile!),
                                fit: BoxFit.cover),
                          ),
                        );
                      }
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/photo.png'),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
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
              RoundedDropdownInput(onSelectSex, jenisKelaminValues),
              RoundedDateInput(onSelectDate),
              RoundedInputField(
                hintText: "Nomor Handphone Anda",
                controller: _noHPController,
                icon: Icons.phone,
                textInputType: TextInputType.phone,
              ),
              RoundedInputField(
                hintText: "Alamat Lengkap Anda",
                controller: _alamatController,
                icon: Icons.location_on,
              ),
              RoundedPasswordField(
                controller: _passwordController,
              ),
              SizedBox(height: defaultMargin * 3),
            ],
          ),
        ),
      ),
    );
  }
}
