part of 'screens.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Aplikasi',
              style: normalDark1,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'SITAEK',
                style: headerDark.copyWith(fontSize: 30),
              ),
            ),
            GradientRoundedButton(
              child: Text('Login', style: normalLight1,),
              onPressed: () {
                print('tes');
                Get.to(() => LoginScreen());
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
