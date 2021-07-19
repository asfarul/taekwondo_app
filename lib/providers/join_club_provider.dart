part of 'providers.dart';

class JoinClubProvider extends ChangeNotifier {
  final Completer<GoogleMapController> _mapController = Completer();
  Completer<GoogleMapController> get mapController => _mapController;

  ClubServices clubServices = ClubServices();

  CameraPosition? _cameraPosition;
  CameraPosition? get cameraPosition => _cameraPosition;

  List<JoinClubResponseDataClubs?> _clubs = [];

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  String? _selectedMarker;
  String? get selectedMarker => _selectedMarker;

  bool _isLoadSuccess = false;
  bool get isLoadSuccess => _isLoadSuccess;

  Future<void> intiMap(BuildContext context) async {
    _cameraPosition = CameraPosition(
      target: LatLng(pontianakLatitude, pontianakLongitude),
      zoom: 12.0,
    );
    JoinClubResponse? response = await clubServices.getAllClubs(context);
    if (response?.data != null) {
      print('sukses');
      response?.data?.clubs?.forEach((element) {
        _clubs.add(element);
      });

      setMarkers(_clubs);
      _isLoadSuccess = true;
    }

    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) async {
    if (!_mapController.isCompleted) {
      _mapController.complete(controller);
    }

    setMarkers(_clubs);

    notifyListeners();
  }

  void setMarkers(List<JoinClubResponseDataClubs?> clubs) {
    if (_clubs.length != 0) {
      _clubs.forEach((data) {
        List<String>? coor = data?.coordinat?.split(',');
        _markers.add(
          Marker(
              markerId: MarkerId(data?.id ?? ''),
              position: LatLng(
                double.parse(coor?[0] ?? '0'),
                double.parse(coor?[1] ?? '0'),
              ),
              onTap: () {
                _selectedMarker = data?.id;
              }),
        );
      });
    }
  }
}
