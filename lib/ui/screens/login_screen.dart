part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                  hintText: "Masukkan email anda",
                  controller: _emailController,
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  controller: _passwordController,
                  onChanged: (value) {},
                ),

                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GradientRoundedButton(
                      child: Text(
                        'Login',
                        style: normalLight1,
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        // print('tes');
                        Provider.of<AuthProvider>(context, listen: false).login(
                            context,
                            _emailController.text,
                            _passwordController.text);
                      },
                    );
                  },
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Belum punya akun?',
                    style: normalDark1.copyWith(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
