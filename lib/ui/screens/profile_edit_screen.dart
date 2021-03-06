part of 'screens.dart';

class ProfileEditScreen extends StatelessWidget {
  final UserModel user;
  ProfileEditScreen(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .pickImage(context);
                },
                child: Consumer<AuthProvider>(
                  builder: (context, prov, child) {
                    if (user.urlFoto != null && prov.pictureFile == null) {
                      return Container(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: FancyShimmerImage(
                                imageUrl:
                                    Api.userBaseFoto + '/' + user.urlFoto!,
                                height: 100,
                                width: 100,
                                boxFit: BoxFit.cover,
                              ),
                            ),
                            child ?? SizedBox(),
                          ],
                        ),
                      );
                    }
                    if (prov.pictureFile != null) {
                      return Container(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.file(
                                prov.pictureFile!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child ?? SizedBox(),
                          ],
                        ),
                      );
                    }
                    return Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              'assets/images/user-default.jpeg',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child ?? SizedBox(),
                        ],
                      ),
                    );
                  },
                  child: Positioned(
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
            Consumer<AuthProvider>(builder: (context, prov, child) {
              if (prov.isLoading) {
                return CircularProgressIndicator();
              }
              return GradientRoundedButton(
                child: Text(
                  'Simpan Perubahan',
                  style: normalLight1,
                ),
                onPressed: () {
                  prov.updateProfile(context,
                      nama: _namaController.text,
                      email: _emailController.text,
                      jenisKelamin: _jenisKelamin!,
                      tglLahir: _tglLahir!,
                      noHp: _noHPController.text,
                      alamat: _alamatController.text);
                },
              );
            }),
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
            RoundedDateInput(
                onSelectDate, user.tglLahir, 'Tanggal Lahir Anda', true),
            RoundedInputField(
              hintText: "Nomor Handphone Ansda",
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
