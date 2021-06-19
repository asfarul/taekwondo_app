part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _credentials = GetStorage(myCredPref);

  void credentialsCheck() {
    Timer(Duration(seconds: 2), () {
      _credentials.writeIfNull(authKey, false);
      if (_credentials.read(authKey)) {
        Get.offAll(HomeScreen());
      } else {
        Get.offAll(StartScreen());
      }
    });
  }

  @override
  void initState() {
    credentialsCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('NAMA APLIKASI'),
          ),
        ),
      ),
    );
  }
}
