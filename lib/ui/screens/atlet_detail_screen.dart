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
              Text(
                'ayylmao@gmail.com',
                style: normalLight1,
              ),
            ],
          ),
        );
    return Scaffold(
      body: Column(
        children: [
          _header(),
        ],
      ),
    );
  }
}
