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
    return Scaffold(
      body: Column(
        children: [
          _header(),
          Row(
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
                        style: smallGrey2,
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
                        style: smallGrey2,
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
          ),
          Container(
            width: double.infinity,
            margin:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
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
                  style: smallGrey2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
