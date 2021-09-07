part of 'screens.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel? user;
  final Atlet? atlet;
  final String? kategori;
  final String? kelas;
  final bool isAtlet;
  final bool isPelatih;
  UserDetailScreen({
    required this.user,
    this.kategori = '-',
    this.atlet,
    this.kelas = '-',
    this.isAtlet = false,
    this.isPelatih = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _header() => Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.centerLeft,
              colors: [
                primaryColor,
                secondaryColor,
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      if (isPelatih)
                        IconButton(
                          onPressed: () {
                            Get.to(() => AtletEditScreen(atlet!));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: user?.urlFoto == null
                      ? Image.asset(
                          'assets/images/user-default.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : FancyShimmerImage(
                          imageUrl: Api.userBaseFoto + '/' + user!.urlFoto!,
                          height: 100,
                          width: 100,
                          boxFit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                user?.name ?? '-',
                style: largeLight1,
              ),
              // Text(
              //   'ayylmao@gmail.com',
              //   style: normalLight1,
              // ),
            ],
          ),
        );
    Widget _infoField(String title, String value) => Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: smallGrey2,
              ),
              Text(
                value,
                style: normalDark1,
              ),
            ],
          ),
        );
    Widget _infoPribadi() => Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Pribadi',
                style: normalDark2,
              ),
              _infoField('Email', user?.email ?? '-'),
              _infoField('Jenis Kelamin', user?.jenisKelamin ?? '-'),
              _infoField('Tanggal Lahir (Umur)',
                  '${formatDateToStringValue(user!.tglLahir!) ?? '-'} (${calculateAge(user!.tglLahir!)})'),
              _infoField('No HP', user?.noHp ?? '-'),
              _infoField('Alamat', user?.alamat ?? '-'),
            ],
          ),
        );
    Widget _infoAtlet() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(defaultMargin, 20, 10, 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kategori',
                      style: smallDark2,
                    ),
                    Text(
                      kategori ?? '-',
                      style: largeDark1,
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(5, 20, defaultMargin, 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kelas',
                      style: smallDark2,
                    ),
                    Text(
                      kelas ?? '-',
                      style: largeDark1,
                    )
                  ],
                ),
              ),
            ),
          ],
        );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            if (isAtlet) _infoAtlet(),
            _infoPribadi(),
            SizedBox(height: 10),
            if (isAtlet) RecordList(isPelatih, atlet!),
          ],
        ),
      ),
    );
  }
}
