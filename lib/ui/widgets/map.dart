part of 'widgets.dart';

class Map extends StatelessWidget {
  final Completer<GoogleMapController>? mapController;
  final Set<Marker> markers;
  final CameraPosition? camera;
  final Function(GoogleMapController)? onMapCreated;

  const Map({
    Key? key,
    this.onMapCreated,
    this.mapController,
    this.camera,
    this.markers = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: camera ??
          CameraPosition(
            target: LatLng(pontianakLatitude, pontianakLongitude),
            zoom: 10.0,
          ),
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      compassEnabled: false,
      tiltGesturesEnabled: false,
      mapToolbarEnabled: false,
      markers: markers,
      onMapCreated: onMapCreated,
    );
  }
}
