part of 'screens.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    TextEditingController _emailController = TextEditingController();
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
                      child: Image.network(
                        'https://randomuser.me/api/portraits/women/72.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
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
            child: Container(
              height: 40,
              width: size.width * 1,
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
            SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }
}
