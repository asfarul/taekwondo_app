part of 'screens.dart';

class AtletEditScreen extends StatelessWidget {
  final Atlet atlet;
  AtletEditScreen(
    this.atlet, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _kategori;
    String? _kelas;

    void onSelectDate(String val) {
      _kategori = val;
    }

    void onSelectSex(String val) {
      _kelas = val;
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
                      Expanded(
                        child: Text(
                          atlet.user?.name ?? '-',
                          style: largeLight1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                child: atlet.user?.urlFoto != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: FancyShimmerImage(
                          imageUrl:
                              Api.userBaseFoto + '/' + atlet.user!.urlFoto!,
                          height: 100,
                          width: 100,
                          boxFit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/user-default.jpeg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
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
                onPressed: () {},
              );
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header,
            RoundedDropdownInput(
                onSelectSex, _kelas, jenisKelaminValues, 'Pilih Jenis Kelamin'),
            SizedBox(height: defaultMargin * 2),
          ],
        ),
      ),
    );
  }
}
