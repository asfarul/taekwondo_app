part of 'providers.dart';

class NotifProvider extends ChangeNotifier {
  List<NotificationModel>? _notifications;
  List<NotificationModel>? get notifications => _notifications;

  bool isLoading = false;
  bool isProcess = false;

  NotifServices _notifServices = NotifServices();

  void loadNotifications(BuildContext context, String clubId) async {
    isLoading = true;
    var response =
        await _notifServices.getAllNotif(context, Api.notif + clubId);
    _notifications = [];
    if (response != null) {
      if (response['data'] != null) {
        print(response['data']['applications']);

        _notifications = List<NotificationModel>.from(response['data']
                ['applications']
            .map((x) => NotificationModel.fromJson(x)));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void accept(BuildContext context, String? id, int index) async {
    if (id == null) {
      return;
    }

    WidgetHelpers.showConfirmDialog(
      context,
      title: 'Terima Permohonan',
      message: 'Anda yakin ingin menerima permohonan?',
      confirmText: 'Terima',
      onConfirm: () async {
        Get.back();
        isProcess = true;
        notifyListeners();
        dio.FormData data = dio.FormData.fromMap({
          'lamaran_id': id,
        });

        var response = await _notifServices.accept(context, data);

        if (response != null) {
          WidgetHelpers.snackbar(context, SnackbarType.success,
              message: 'Permohonan berhasil diterima', title: 'Berhasil!');
          _notifications?.removeAt(index);
        }
        isProcess = false;
        notifyListeners();
      },
    );
  }

  void decline(BuildContext context, String? id, int index) async {
    if (id == null) {
      return;
    }

    WidgetHelpers.showConfirmDialog(
      context,
      title: 'Tolak Permohonan',
      message: 'Anda yakin ingin menolak permohonan?',
      confirmText: 'Tolak',
      onConfirm: () async {
        Get.back();
        isProcess = true;
        notifyListeners();
        dio.FormData data = dio.FormData.fromMap({
          'lamaran_id': id,
        });

        var response = await _notifServices.decline(context, data);

        if (response != null) {
          WidgetHelpers.snackbar(context, SnackbarType.success,
              message: 'Permohonan berhasil ditolak', title: 'Berhasil!');
          _notifications?.removeAt(index);
        }
        isProcess = false;
        notifyListeners();
      },
    );
  }
}
