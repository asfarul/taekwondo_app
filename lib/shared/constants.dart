part of 'shared.dart';

const defaultMargin = 16.0;

// Shared Preferences
String myCredPref = 'MyCredentials';
String userId = 'user_id';
String authKey = 'auth_key';

// Status Club
String pending = 'PENDING';
String bergabung = 'BERGABUNG';
String kosong = 'KOSONG';
String error = 'ERROR';

// FOTO URL
String userBaseFoto = Api.base + 'images/users';
String clubBaseFoto = Api.base + 'images/clubs';
String newsBaseFoto = Api.base + 'images/news';

// DioError messages
String cancelMessage = 'Permintaan request ke server dibatalkan.';
String connectTimeoutMessage =
    'Melewati batas waktu untuk terhubung ke server, silahkan coba lagi nanti';
String receiveTimeoutMessage =
    'Melewati batas waktu untuk menerima data server, silahkan coba lagi nanti';
String sendTimeoutMessage =
    'Melewati batas waktu untuk mengirim data ke server, silahkan coba lagi nanti';
String defaultMessage =
    'Terjadi kesalahan dalam melakukan request, silahkan coba lagi nanti';

final List<String> jenisKelaminValues = ['LAKI-LAKI', 'PEREMPUAN'];

// koordinat
double pontianakLatitude = -0.07728020450218849;
double pontianakLongitude = 109.36279287099727;
