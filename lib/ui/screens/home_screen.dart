part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Column(children: [
        Text('Home Screen'),
        GradientRoundedButton(
          child: Text('logout'),
          onPressed: () {
            authProvider.logout();
          },
        )
      ]),
    );
  }
}
