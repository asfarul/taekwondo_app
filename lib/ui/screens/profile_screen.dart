part of 'screens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _header = Container(
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
      backgroundColor: bgColor,
      body: Column(
        children: [
          _header,
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileEditScreen());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(
                        vertical: 30, horizontal: defaultMargin),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: grey,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Edit Profile',
                          style: normalDark1,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    WidgetHelpers.showConfirmDialog(
                      context,
                      title: 'Anda yakin ingin logout?',
                      message:
                          'Anda membutuhkan email dan password untuk masuk kembali ke aplikasi',
                      confirmText: 'Ya',
                      cancelText: 'Tidak',
                      onConfirm: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .logout();
                      },
                      onCancel: () {
                        Get.back();
                      },
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(
                          vertical: 30, horizontal: defaultMargin),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: grey,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Log out',
                            style: normalDark1,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
