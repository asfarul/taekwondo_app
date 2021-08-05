part of 'screens.dart';

class KlubScreen extends StatelessWidget {
  final ClubModel club;
  final bool isPelatih;

  const KlubScreen(
    this.club, {
    this.isPelatih = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String _jenisKelamin;
    String _kategoriId;
    String _kelasId;

    void onSelectSex(String val) {
      _jenisKelamin = val;
    }

    void onSelectCategory(String val) {
      _kategoriId = val;
    }

    void onSelectClass(String val) {
      _kelasId = val;
    }

    _showDialog() async {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Cari Atlet'),
            contentPadding: const EdgeInsets.all(16.0),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundedInputField(
                    hintText: 'Cari berdasarkan nama',
                  ),
                  RoundedDropdownInput(onSelectCategory, null,
                      jenisKelaminValues, 'Pilih Kategori'),
                  RoundedDropdownInput(onSelectSex, null, jenisKelaminValues,
                      'Pilih Jenis Kelamin'),
                  RoundedDropdownInput(
                      onSelectClass, null, jenisKelaminValues, 'Pilih Kelas'),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Flexible(
                    child: DialogButton(
                      child: Text(
                        'Batal',
                        style: normalLight1,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      color: grey,
                    ),
                  ),
                  Flexible(
                    child: DialogButton(
                      child: Text(
                        'Cari',
                        style: normalLight1,
                      ),
                      onPressed: () {},
                      gradient: LinearGradient(
                          colors: [primaryColor, midColor, secondaryColor],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    Widget _header() => Container(
          width: size.width * 1,
          height: 250,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: defaultMargin, right: defaultMargin, top: 30),
                width: size.width * 1,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.centerLeft,
                    colors: [
                      primaryColor,
                      secondaryColor,
                    ],
                  ),
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(30),
                  //   bottomRight: Radius.circular(30),
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: club.foto == null
                            ? Image.asset(
                                'assets/images/user-default.jpeg',
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              )
                            : FancyShimmerImage(
                                imageUrl: Api.clubBaseFoto + '/' + club.foto!,
                                errorWidget: Icon(Icons.broken_image),
                                height: 80,
                                width: 80,
                                boxFit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Klub Taekwondo',
                            style: normalLight1,
                          ),
                          Text(
                            club.nama ?? '',
                            style: largeLight2,
                          ),
                          Text(
                            club.alamat ?? '',
                            style: smallLight1,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: SafeArea(
                  child: Container(
                    width: size.width * 1,
                    padding: EdgeInsets.only(top: 10),
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
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => NotificationScreen());
                                },
                                child: Badge(
                                  badgeContent: Text('4'),
                                  badgeColor: Colors.grey[400]!,
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  Get.to(() => KlubEditScreen());
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 10.0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi Klub :',
                    style: normalDark3.copyWith(color: Colors.grey),
                  ),
                  Text(
                    club.deskripsi ?? '-',
                    style: normalDark1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Atlet',
                    style: largeDark1,
                  ),
                  IconButton(
                    onPressed: _showDialog,
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => AtletDetailScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 10,
                          left: defaultMargin,
                          right: defaultMargin),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: FancyShimmerImage(
                                imageUrl: Api.clubBaseFoto + '/',
                                errorWidget: Icon(Icons.broken_image),
                                height: 50,
                                width: 50,
                                boxFit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Membatu',
                                  style: normalDark1,
                                ),
                                Text(
                                  'Poomsae | Pria 69Kg',
                                  style: normalGrey1.copyWith(
                                      color: Colors.grey[600], fontSize: 13),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: grey,
                              ),
                              Text(
                                '10',
                                style: largeGrey2,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
