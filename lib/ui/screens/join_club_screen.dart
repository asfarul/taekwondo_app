part of 'screens.dart';

class JoinClubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var joinClubProv = Provider.of<JoinClubProvider>(context);
    if (joinClubProv.cameraPosition == null || !joinClubProv.isLoadSuccess) {
      joinClubProv.intiMap(context);
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: joinClubProv.cameraPosition != null
                ? Map(
                    camera: joinClubProv.cameraPosition,
                    onMapCreated: joinClubProv.onMapCreated,
                    markers: joinClubProv.markers,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40)),
              margin: EdgeInsets.all(defaultMargin),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          if (joinClubProv.selectedMarker != null)
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: defaultMargin * 2,
                      left: defaultMargin,
                      right: defaultMargin),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              '${joinClubProv.baseFotoURL}/${joinClubProv.selectedMarker?.urlFoto}',
                              height: 64.0,
                              width: 64.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                joinClubProv.selectedMarker!.namaKlub!,
                                style: normalDark2,
                              ),
                              Text(
                                joinClubProv.selectedMarker!.alamat!,
                                style: smallDark1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                colors: [
                                  primaryColor,
                                  midColor,
                                  secondaryColor
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {},
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    'Gabung',
                                    style: normalLight1,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
