part of 'providers.dart';

class JoinClubProvider extends ChangeNotifier {
  //Property Google Map Controller completer
  Completer<GoogleMapController> _completer = Completer();
  Completer<GoogleMapController> get completer => _completer;

  //Property Google Map Controller
  GoogleMapController? _controller;
  GoogleMapController? get controller => _controller;

  ClubServices clubServices = ClubServices();

  CameraPosition? _cameraPosition;
  CameraPosition? get cameraPosition => _cameraPosition;

  List<JoinClubResponseDataClubs?> _clubs = [];

  String baseFotoURL = Api.clubBaseFoto;

  String get clubFoto => _selectedMarker?.urlFoto ?? '';

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  JoinClubResponseDataClubs? _selectedMarker;
  JoinClubResponseDataClubs? get selectedMarker => _selectedMarker;

  bool _isLoadSuccess = false;
  bool get isLoadSuccess => _isLoadSuccess;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

      baseFotoURL = response!.data!.baseFoto!;

      // setMarkers(_clubs);
      _isLoadSuccess = true;
      setMarkers(_clubs);
    }

    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) async {
    print('onMapCreated');

    if (!_completer.isCompleted) {
      _completer.complete(controller);
      _controller = controller;
    }

    notifyListeners();
  }

  void changeCameraPosition(LatLng location) {
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 18)));
  }

  void setMarkers(List<JoinClubResponseDataClubs?> clubs) {
    if (_clubs.length != 0) {
      _clubs.forEach((data) {
        List<String>? coor = data?.coordinat?.split(',');
        var position = LatLng(
          double.parse(coor?[0] ?? '0'),
          double.parse(coor?[1] ?? '0'),
        );
        _markers.add(
          Marker(
              markerId: MarkerId(data?.id ?? ''),
              position: position,
              onTap: () {
                _selectedMarker = data;
                // changeCameraPosition(position);
                notifyListeners();
              }),
        );
      });
    }
  }

  void joinClub(ClubModel? club, BuildContext context) async {
    if (club != null) {
      _isLoading = true;
      notifyListeners();
      dio.FormData data = dio.FormData.fromMap({
        'club_id': club.id,
      });
      var response = await clubServices.joinClub(context, data);
      if (response != null) {
        if (response['meta']['code'] == 200) {
          Provider.of<SettingsProvider>(context, listen: false)
              .setAfterJoin(club);
          Get.offAll(() => HomeScreen());
          WidgetHelpers.showSuccessDialog(context,
              title: 'Berhasil',
              message:
                  'Anda sedang melakukan permohonan untuk bergabung ke klub ${club.nama}.',
              confirmText: 'OK', onConfirm: () {
            Get.back();
          });
        }
      }
      _isLoading = false;
      notifyListeners();
    }
  }
}
