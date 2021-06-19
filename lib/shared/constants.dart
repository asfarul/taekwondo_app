part of 'shared.dart';

const defaultMargin = 16.0;

// Shared Preferences
String myCredPref = 'MyCredentials';
String userId = 'user_id';
String authKey = 'auth_key';

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
