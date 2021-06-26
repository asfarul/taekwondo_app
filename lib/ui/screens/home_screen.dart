part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: bgColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        'https://randomuser.me/api/portraits/women/72.jpg',
                        height: 64.0,
                        width: 64.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              clubCard()
            ],
          ),
        ),
      ),
    ));
  }

  Container clubCard() {
    return Container(
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
              color: Colors.black12,
              offset: Offset(1, 16),
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
    );
  }
}
