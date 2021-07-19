part of 'screens.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Applications> notifications = [];
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            color: bgColor,
          )),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: darkGrey,
                              size: 28,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Notifikasi',
                            style: headerDark,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: darkGrey,
                        size: 32,
                      ),
                    ],
                  ),
                ),
                // child ?? SizedBox(),
                // notifications.isNotEmpty
                //     ?
                Expanded(
                    child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return NotificationItem();
                  },
                ))
                // : Expanded(
                //     child: Center(
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Container(
                //             width: MediaQuery.of(context).size.width * 0.6,
                //             height:
                //                 MediaQuery.of(context).size.height * 0.3,
                //             decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         'assets/images/no_notification.png'),
                //                     fit: BoxFit.contain)),
                //           ),
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Text(
                //             'Tidak ada notifikasi saat ini.',
                //             style: subheaderDark,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
