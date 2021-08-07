part of 'screens.dart';

class ProfileEditScreen extends StatelessWidget {
  final UserModel user;
  ProfileEditScreen(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    TextEditingController _emailController =
        TextEditingController(text: user.email);
    TextEditingController _namaController =
        TextEditingController(text: user.name);
    TextEditingController _alamatController =
        TextEditingController(text: user.alamat);
    TextEditingController _noHPController =
        TextEditingController(text: user.noHp);
    String? _tglLahir =
        user.tglLahir == null ? null : formatDateToStringValue(user.tglLahir!);
    String? _jenisKelamin = user.jenisKelamin;

    void onSelectDate(String val) {
      _tglLahir = val;
    }

    void onSelectSex(String val) {
      _jenisKelamin = val;
    }

    Widget _header = Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.centerLeft,
          colors: [
            primaryColor,
            secondaryColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Edit Profile',
                        style: largeLight1,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: user.urlFoto == null
                          ? Image.asset(
                              'assets/images/user-default.jpeg',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            )
                          : FancyShimmerImage(
                              imageUrl: Api.userBaseFoto + '/' + user.urlFoto!,
                              width: 100,
                              height: 100,
                              boxFit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          color: Colors.white,
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: darkGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientRoundedButton(
              child: Text(
                'Simpan Perubahan',
                style: normalLight1,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header,
            RoundedInputField(
              hintText: "Nama Lengkap Anda",
              controller: _namaController,
              icon: Icons.person,
            ),
            RoundedInputField(
              hintText: "Alamat Email Anda",
              controller: _emailController,
              value: user.email,
              icon: Icons.mail,
              textInputType: TextInputType.emailAddress,
            ),
            RoundedDropdownInput(onSelectSex, _jenisKelamin!,
                jenisKelaminValues, 'Pilih Jenis Kelamin'),
            RoundedDateInput(onSelectDate, user.tglLahir),
            RoundedInputField(
              hintText: "Nomor Handphone Anda",
              controller: _noHPController,
              value: user.noHp,
              icon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            RoundedInputField(
              hintText: "Alamat Lengkap Anda",
              controller: _alamatController,
              value: user.alamat,
              icon: Icons.location_on,
            ),
            SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }
}
