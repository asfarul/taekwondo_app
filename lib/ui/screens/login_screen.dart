part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: headerDark,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Text(
                  "Masukkan email dan password anda untuk melanjutkan",
                  textAlign: TextAlign.center,
                  style: subheaderDark,
                ),
              ),
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                controller: _emailController,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                controller: _passwordController,
                onChanged: (value) {},
              ),
              GradientRoundedButton(
                child: Text(
                  'Login',
                  style: normalLight1,
                ),
                onPressed: () {
                  print('tes');
                  WidgetHelpers.snackbar(context, SnackbarType.warning, title: 'Success', message: 'berhasil login');
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
