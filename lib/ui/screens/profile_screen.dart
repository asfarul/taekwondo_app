part of 'screens.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  const ProfileScreen(
    this.user, {
    Key? key,
  }) : super(key: key);

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
          bottomLeft: Radius.circular(40),
          // bottomRight: Radius.circular(32),
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
              child: user.urlFoto == null
                  ? Image.asset(
                      'assets/images/user-default.jpeg',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    )
                  : FancyShimmerImage(
                      imageUrl: Api.userBaseFoto + '/' + user.urlFoto!,
                      width: 100,
                      height: 100,
                      boxFit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            user.name!,
            style: largeLight1,
          ),
          Text(
            user.email!,
            style: normalLight1,
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header,
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
              child: Column(
                children: [
                  MenuItem(
                    label: 'Edit Profile',
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Get.to(() => ProfileEditScreen(user));
                    },
                  ),
                  // MenuItem(
                  //   label: 'Ganti Password',
                  //   icon: Icon(
                  //     Icons.vpn_key,
                  //     color: Colors.grey,
                  //   ),
                  //   onTap: () {
                  //     Get.to(() => ProfileEditScreen());
                  //   },
                  // ),
                  MenuItem(
                    label: 'Log Out',
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.grey,
                    ),
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
                              .logout(context);
                        },
                        onCancel: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final VoidCallback? onTap;
  final Icon icon;
  final String? label;

  const MenuItem({
    this.onTap,
    this.icon = const Icon(
      Icons.edit,
      color: Colors.grey,
    ),
    this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: defaultMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 16,
            ),
            Text(
              label ?? '',
              style: normalDark1,
            )
          ],
        ),
      ),
    );
  }
}
