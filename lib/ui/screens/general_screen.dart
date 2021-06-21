part of 'screens.dart';

class GeneralScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? child;
  final VoidCallback? onBackButtonPressed;
  const GeneralScreen({
    this.title = '',
    this.subtitle = '',
    this.onBackButtonPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    print('rebuild general...');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(defaultMargin),
                      width: double.infinity,
                      height: 130,
                      child: Row(
                        children: [
                          if (onBackButtonPressed != null)
                            IconButton(
                              onPressed: onBackButtonPressed,
                              icon: Icon(
                                Icons.arrow_back,
                                size: 28,
                              ),
                            ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(title, style: headerDark),
                                Text(subtitle, style: subheaderDark),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: defaultMargin),
                    child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
