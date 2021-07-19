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
                Container(
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
                              'Lucinta Luna Bin Fatah',
                              style: normalDark2.copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProfileScreen());
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            'https://randomuser.me/api/portraits/women/72.jpg',
                            height: 64.0,
                            width: 64.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                clubCard(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Berita Terbaru',
                            style: largeDark2,
                          ),
                          GestureDetector(
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
                    Container(
                      width: double.infinity,
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => NewsDetailScreen());
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Pengumuman Hasil Tournament',
                                              style: normalDark2,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 2.0),
                                            Text('tes2', style: smallDark1),
                                            const SizedBox(height: 2.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 6.0,
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://picsum.photos/200/300',
                                        height: 180,
                                        width: 290,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget clubCard() {
    return GestureDetector(
      onTap: () {
        Get.to(() => JoinClubScreen());
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
                    'Klub Taekwondo Anda',
                    style: smallLight1,
                  ),
                  Text(
                    'Klub Taekwondo Cabang A',
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
                            'Atlet',
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
                            'Poomsae',
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
                            'Tgl Bergabung',
                            style: smallLight1,
                          ),
                          Text(
                            '19/05/2019',
                            style: normalLight1.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
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
}
