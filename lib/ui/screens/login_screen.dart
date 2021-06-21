part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();
    print('rebuild login screen...');
    return GeneralScreen(
      title: 'Login',
      subtitle: 'Login untuk melanjutkan',
      onBackButtonPressed: () {
        Get.back();
        // Navigator.of(context).pop();
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),
              RoundedInputField(
                hintText: "Masukkan email anda",
                controller: _emailController,
              ),
              RoundedPasswordField(
                controller: _passwordController,
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Consumer<AuthProvider>(
                builder: (context, value, child) {
                  print('rebuild Button...');
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
                      Provider.of<AuthProvider>(context, listen: false).login(
                          context,
                          _emailController.text,
                          _passwordController.text);
                    },
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Get.to(() => RegisterScreen());
                },
                child: Text(
                  'Belum punya akun?',
                  style: normalDark1.copyWith(color: primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
