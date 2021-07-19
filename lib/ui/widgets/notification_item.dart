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
                width: 40,
                height: 40,
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
              Row(
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
                        onTap: () {},
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
                        onTap: () {},
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
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 29,
          child: Text(
              '${DateFormat('EEE, dd/MM/y HH : mm').format(DateTime.now())}',
              style: smallDark1),
        ),
      ],
    );
  }
}
