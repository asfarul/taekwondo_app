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
