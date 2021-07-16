part of 'widgets.dart';

class NotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                width: 60,
                height: 60,
                margin: EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://ui-avatars.com/api/?name=Asfarul+Haq&background=2196F3&color=fff'),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Judul',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: normalDark2),
                    Text(
                      'Pesan',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: normalDark1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(right: 24, top: 5),
            child: Icon(
              Icons.close,
              size: 24,
              color: grey,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 29,
          child: Text('Pukul ${DateFormat('HH : mm').format(DateTime.now())}',
              style: smallDark1),
        ),
      ],
    );
  }
}
