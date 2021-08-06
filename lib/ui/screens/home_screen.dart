part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<SettingsProvider>(
                    builder: (context, prov, child) {
                      if (prov.clubStatus == '') {
                        prov.initSettings(context);
                      }
                      if (prov.clubStatus != '' && prov.clubStatus != error) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 28, horizontal: defaultMargin),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selamat datang,',
                                      style: normalDark1,
                                    ),
                                    Text(
                                      prov.user?.name ?? '-',
                                      style: normalDark2.copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ProfileScreen(prov.user!));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: prov.user?.urlFoto == null
                                      ? Image.asset(
                                          'assets/images/user-default.jpeg',
                                          fit: BoxFit.cover,
                                          width: 64,
                                          height: 64,
                                        )
                                      : FancyShimmerImage(
                                          imageUrl: Api.userBaseFoto +
                                              '/' +
                                              prov.user!.urlFoto!,
                                          errorWidget:
                                              Icon(Icons.broken_image_outlined),
                                          width: 64,
                                          height: 64,
                                          boxFit: BoxFit.cover,
                                        ),
                                ),
                              )
                            ],
                          ),
                        );
                      }

                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 28, horizontal: defaultMargin),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textShimmer(width: 110, height: 17),
                                  SizedBox(height: 6),
                                  textShimmer(width: 70, height: 15),
                                ],
                              ),
                            ),
                            roundedShimmer(
                                width: 64, height: 64, borderRadius: 16),
                          ],
                        ),
                      );
                    },
                  ),
                  Consumer<SettingsProvider>(builder: (context, prov, child) {
                    if (prov.clubStatus == aktif) {
                      return clubCard(
                          club: prov.myClub,
                          isPelatih: prov.role == 'Pelatih',
                          nama: prov.myClub!.nama!,
                          kategori: prov.kategori ?? '-',
                          status: prov.role ?? '-');
                    } else {}

                    if (prov.clubStatus == kosong) {
                      return joinClubCard();
                    }

                    if (prov.clubStatus == melamar) {
                      return melamarClubCard(namaKlub: prov.myClub!.nama!);
                    }

                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                          vertical: defaultMargin * 2),
                      child: roundedShimmer(borderRadius: 16, height: 135),
                    );
                  }),
                  Consumer<SettingsProvider>(
                    builder: (context, prov, child) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              prov.clubStatus == '' || prov.clubStatus == error
                                  ? textShimmer(width: 120, height: 20)
                                  : Text(
                                      'Berita Terbaru',
                                      style: largeDark2,
                                    ),
                              prov.clubStatus == '' || prov.clubStatus == error
                                  ? textShimmer(width: 50, height: 16)
                                  : GestureDetector(
                                      onTap: () {
                                        Get.to(() => NewsListScreen());
                                      },
                                      child: Text(
                                        'Lihat Semua',
                                        style: normalDark1,
                                      ),
                                    )
                            ],
                          ),
                        ),
                        Consumer<SettingsProvider>(
                            builder: (context, prov, child) {
                          return Container(
                            width: double.infinity,
                            height: 280,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: prov.clubStatus == '' ||
                                      prov.clubStatus == error
                                  ? 3
                                  : prov.berita.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        NewsDetailScreen(prov.berita[index]));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    width: 310.0,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: <Widget>[
                                        Positioned(
                                          bottom: 0.0,
                                          child: Container(
                                            height: 150.0,
                                            width: 310.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  prov.clubStatus == '' ||
                                                          prov.clubStatus ==
                                                              error
                                                      ? textShimmer(
                                                          width: 180,
                                                          height: 18)
                                                      : Text(
                                                          prov.berita[index]
                                                              .judul!,
                                                          style: normalDark2,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  const SizedBox(height: 2.0),
                                                  prov.clubStatus == '' ||
                                                          prov.clubStatus ==
                                                              error
                                                      ? textShimmer(
                                                          width: 70, height: 15)
                                                      : Text(
                                                          DateFormat(
                                                                  'EEE, dd MMM yyyy')
                                                              .format(prov
                                                                  .berita[index]
                                                                  .createdAt!),
                                                          style: smallDark1),
                                                  const SizedBox(height: 2.0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0.0, 2.0),
                                                blurRadius: 6.0,
                                              )
                                            ],
                                          ),
                                          child: prov.clubStatus == '' ||
                                                  prov.clubStatus == error
                                              ? roundedShimmer(
                                                  width: 290,
                                                  height: 180,
                                                  borderRadius: 20)
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: FancyShimmerImage(
                                                    imageUrl: Api.newsBaseFoto +
                                                        '/' +
                                                        prov.berita[index]
                                                            .thumbnail!,
                                                    width: 290,
                                                    height: 180,
                                                    errorWidget: Icon(Icons
                                                        .broken_image_rounded),
                                                    boxFit: BoxFit.cover,
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget clubCard(
      {ClubModel? club,
      bool? isPelatih,
      String nama = '',
      String status = '',
      String kategori = ''}) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => JoinClubScreen());
        if (club != null && isPelatih != null) {
          Get.to(() => KlubScreen(
                club,
                isPelatih: isPelatih,
              ));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin * 2),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: primaryColor.withOpacity(0.3),
                offset: Offset(1, 15),
                spreadRadius: 0)
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Klub Taekwondo',
                    style: smallLight1,
                  ),
                  Text(
                    nama,
                    style: normalLight1.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: smallLight1,
                          ),
                          Text(
                            status,
                            style: normalLight1.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kategori',
                            style: smallLight1,
                          ),
                          Text(
                            kategori,
                            style: normalLight1.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       'Tgl Bergabung',
                      //       style: smallLight1,
                      //     ),
                      //     Text(
                      //       '19/05/2019',
                      //       style: normalLight1.copyWith(
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  Widget melamarClubCard({String namaKlub = ''}) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => JoinClubScreen());
        // Get.to(() => KlubScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin * 2),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: primaryColor.withOpacity(0.3),
                offset: Offset(1, 15),
                spreadRadius: 0)
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anda sedang melamar di klub',
                    style: smallLight1,
                  ),
                  Text(
                    namaKlub,
                    style: largeLight1,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  Widget joinClubCard() {
    return GestureDetector(
      onTap: () {
        Get.to(() => JoinClubScreen());
        // Get.to(() => KlubScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin * 2),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: primaryColor.withOpacity(0.3),
                offset: Offset(1, 15),
                spreadRadius: 0)
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anda tidak memiliki klub',
                    style: smallLight1,
                  ),
                  Text(
                    'Cari dan Gabung Klub',
                    style: largeLight1,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
