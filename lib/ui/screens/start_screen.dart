part of 'screens.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

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
                margin: EdgeInsets.all(20),
                child: Text(
                  'SITAEK',
                  style: headerDark.copyWith(fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.085),
                child: Column(
                  children: [
                    GradientRoundedButton(
                      child: Text(
                        'Login',
                        style: normalLight1,
                      ),
                      onPressed: () {
                        Get.to(() => LoginScreen());
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
