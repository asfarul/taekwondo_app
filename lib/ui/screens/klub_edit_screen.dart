part of 'screens.dart';

class KlubEditScreen extends StatelessWidget {
  final ClubModel club;
  KlubEditScreen(this.club);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _namaController = TextEditingController(text: club.nama ?? '');
    final _alamatController = TextEditingController(text: club.alamat ?? '');
    final _deskripsiController =
        TextEditingController(text: club.deskripsi ?? '');

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
                        'Edit Informasi Klub',
                        style: largeLight1,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Provider.of<ClubProvider>(context, listen: false)
                      .pickImage(context);
                },
                child: Consumer<ClubProvider>(
                  builder: (context, prov, child) {
                    if (club.foto != null && prov.pictureFile == null) {
                      return Container(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: FancyShimmerImage(
                                imageUrl: Api.clubBaseFoto + '/' + club.foto!,
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
            Consumer<ClubProvider>(builder: (context, prov, child) {
              if (prov.isLoading) {
                return CircularProgressIndicator();
              }
              return GradientRoundedButton(
                child: Text(
                  'Simpan Perubahan',
                  style: normalLight1,
                ),
                onPressed: () {
                  prov.updateClub(context,
                      clubId: club.id!,
                      nama: _namaController.text,
                      alamat: _alamatController.text,
                      deskripsi: _deskripsiController.text);
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
              hintText: "Nama Klub",
              icon: Icons.group,
              controller: _namaController,
            ),
            RoundedInputField(
              hintText: "Alamat",
              icon: Icons.location_on,
              textInputType: TextInputType.streetAddress,
              controller: _alamatController,
            ),
            RoundedInputField(
              hintText: "Deskripsi",
              icon: Icons.info,
              controller: _deskripsiController,
            ),
            SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }
}
