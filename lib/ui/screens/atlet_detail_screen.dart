part of 'screens.dart';

class AtletDetailScreen extends StatelessWidget {
  const AtletDetailScreen({Key? key}) : super(key: key);

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
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    'https://randomuser.me/api/portraits/women/72.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Mas Fatah Bin Lucinta Luna',
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
              _infoField('Email', 'ayylmao@email.com'),
              _infoField('Jenis Kelamin', 'Laki-Laki'),
              _infoField('Tanggal Lahir (Umur)', '19/05/2021 (22 Tahun)'),
              _infoField('No HP', '082328312738'),
              _infoField('Alamat', 'Jl. Aspal Gg. Kutu Kupret No. 404'),
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
                      'Kyorugi',
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
                      'Under 63 Kg ',
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
            _infoAtlet(),
            _infoPribadi(),
            SizedBox(height: 10),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Riwayat Kompetisi',
                      style: normalDark2,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.bookmark,
                          color: primaryColor,
                          size: 40,
                        ),
                        title: Text(
                          'UFC Grand Championship 2077',
                          style: normalDark2,
                        ),
                        subtitle: Text(
                          '16 Februari 2077 - 18 Februari 2077 | Medali Emas',
                          style: smallDark1,
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
