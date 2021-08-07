part of 'widgets.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notif;
  final int index;

  NotificationItem(this.notif, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => UserDetailScreen(
              user: notif.user,
            ));
      },
      child: Stack(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(vertical: 25, horizontal: defaultMargin),
            margin: EdgeInsets.only(
                bottom: 6, left: defaultMargin, right: defaultMargin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: notif.user?.urlFoto == null
                        ? Image.asset(
                            'assets/images/user-default.jpeg',
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          )
                        : FancyShimmerImage(
                            imageUrl:
                                Api.userBaseFoto + '/' + notif.user!.urlFoto!,
                            width: 40,
                            height: 40,
                            boxFit: BoxFit.cover,
                          ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notif.user?.name ?? '-',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: normalDark2),
                      Text(
                        'permintaan untuk bergabung ke dalam klub',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: normalDark1.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Consumer<NotifProvider>(
                  builder: (context, prov, child) => Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: prov.isProcess
                                ? null
                                : () {
                                    Provider.of<NotifProvider>(context,
                                            listen: false)
                                        .decline(context, notif.id, index);
                                  },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [primaryColor, midColor, secondaryColor],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: prov.isProcess
                                ? null
                                : () {
                                    Provider.of<NotifProvider>(context,
                                            listen: false)
                                        .accept(context, notif.id, index);
                                  },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 29,
            child: Text(formatCompleteDateToString(notif.tglMelamar!) ?? '-',
                style: smallDark1),
          ),
        ],
      ),
    );
  }
}
