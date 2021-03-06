part of 'screens.dart';

class JoinClubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var joinClubProv = Provider.of<JoinClubProvider>(context);
    if (joinClubProv.cameraPosition == null) {
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
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${joinClubProv.baseFotoURL}/${joinClubProv.selectedMarker?.urlFoto}',
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => roundedShimmer(
                                width: 64,
                                height: 64,
                                borderRadius: 16,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.image_not_supported),
                            ),
                            // child: FancyShimmerImage(
                            //   imageUrl:
                            //       '${joinClubProv.baseFotoURL}/${joinClubProv.selectedMarker?.urlFoto}',
                            //   height: 64.0,
                            //   width: 64.0,
                            //   boxFit: BoxFit.cover,
                            // ),
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
                        Consumer<JoinClubProvider>(
                            builder: (context, prov, child) {
                          if (!prov.isLoading)
                            return Container(
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
                                  onTap: () {
                                    ClubModel club = ClubModel(
                                        id: joinClubProv.selectedMarker!.id,
                                        nama: joinClubProv
                                            .selectedMarker!.namaKlub,
                                        deskripsi: joinClubProv
                                            .selectedMarker!.deskripsi,
                                        coordinat: joinClubProv
                                            .selectedMarker!.coordinat,
                                        alamat:
                                            joinClubProv.selectedMarker!.alamat,
                                        foto: joinClubProv
                                            .selectedMarker!.urlFoto,
                                        pelatih: UserModel(
                                            id: joinClubProv
                                                .selectedMarker!.pelatih!.id,
                                            alamat: joinClubProv.selectedMarker!
                                                .pelatih!.alamat,
                                            email: joinClubProv
                                                .selectedMarker!.pelatih!.email,
                                            jenisKelamin: joinClubProv
                                                .selectedMarker!
                                                .pelatih!
                                                .jenisKelamin,
                                            name: joinClubProv
                                                .selectedMarker!.pelatih!.name,
                                            noHp: joinClubProv
                                                .selectedMarker!.pelatih!.noHp,
                                            roles: null,
                                            tglLahir: null,
                                            urlFoto: joinClubProv
                                                .selectedMarker!
                                                .pelatih!
                                                .urlFoto));
                                    prov.joinClub(club, context);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        'Gabung',
                                        style: normalLight1,
                                      )),
                                ),
                              ),
                            );

                          return CircularProgressIndicator();
                        }),
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
