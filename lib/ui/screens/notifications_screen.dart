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
                notifications.isNotEmpty
                    ? Expanded(
                        child: GroupedListView<dynamic, DateTime>(
                            elements: [],
                            groupBy: (applications) {
                              return DateTime(
                                  applications.year,
                                  applications.tanggal.month,
                                  applications.tanggal.day);
                            },
                            groupComparator: (value1, value2) =>
                                value1.compareTo(value2),
                            itemComparator: (element1, element2) =>
                                element1.tanggal.compareTo(element2.tanggal),
                            groupSeparatorBuilder: (DateTime date) {
                              if (date.day == DateTime.now().day) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: defaultMargin,
                                  ),
                                  child: Text(
                                    'Hari ini',
                                    style: normalDark1.copyWith(fontSize: 16),
                                  ),
                                );
                              } else if (DateTime.now()
                                      .difference(date)
                                      .inDays ==
                                  1) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: defaultMargin,
                                  ),
                                  child: Text(
                                    'Kemarin',
                                    style: normalDark1.copyWith(fontSize: 16),
                                  ),
                                );
                              } else {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: defaultMargin,
                                  ),
                                  child: Text(
                                    DateFormat('EEEE, dd MMM yyyy', 'id-ID')
                                        .format(date),
                                    style: normalDark1.copyWith(fontSize: 16),
                                  ),
                                );
                              }
                              // we will add this later
                            },
                            order: GroupedListOrder.DESC,
                            itemBuilder: (context, dynamic notification) =>
                                GestureDetector(
                                  onTap: () {},
                                  child: NotificationItem(),
                                )),
                      )
                    : Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/no_notification.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Tidak ada notifikasi saat ini.',
                                style: subheaderDark,
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
