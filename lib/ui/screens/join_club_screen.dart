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
                    mapController: joinClubProv.mapController,
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
        ],
      ),
    );
  }
}
