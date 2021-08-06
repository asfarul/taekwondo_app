part of 'screens.dart';

class NotificationScreen extends StatelessWidget {
  final String clubId;
  NotificationScreen(this.clubId);
  @override
  Widget build(BuildContext context) {
    Provider.of<NotifProvider>(context, listen: false)
        .loadNotifications(context, clubId);
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
                Expanded(child:
                    Consumer<NotifProvider>(builder: (context, prov, child) {
                  if (prov.notifications?.length == 0) {
                    return Center(
                      child: Text(
                        'Tidak ada permohonan',
                        style: normalDark1,
                      ),
                    );
                  }
                  if (!prov.isLoading) {
                    return ListView.builder(
                      itemCount: prov.notifications!.length,
                      itemBuilder: (context, index) {
                        return NotificationItem(
                            prov.notifications![index], index);
                      },
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }))
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
