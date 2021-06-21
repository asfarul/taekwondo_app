part of 'screens.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(size.height * 0.085),
                child: Text(
                  'Selamat Datang di Aplikasi',
                  style: normalDark1,
                ),
              ),
              Container(
                child: Text(
                  'SITAEK',
                  style: headerDark.copyWith(fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.045),
                child: Column(
                  children: [
                    GradientRoundedButton(
                      child: Text(
                        'Login',
                        style: normalLight1,
                      ),
                      onPressed: () {
                        Get.to(() => LoginScreen());
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => LoginScreen(),
                        // ));
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: normalDark1.copyWith(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
