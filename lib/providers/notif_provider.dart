part of 'providers.dart';

class NotifProvider extends ChangeNotifier {
  List<NotificationModel>? _notifications;
  List<NotificationModel>? get notifications => _notifications;

  NotifServices _notifServices = NotifServices();

  void loadNotifications(BuildContext context, String clubId) async {
    var response =
        await _notifServices.getAllNotif(context, Api.notif + clubId);
    if (response != null) {
      if (response['data'] != null) {
        _notifications = List<NotificationModel>.from(response['data']
                ['applications']
            .map((x) => NotificationModel.fromJson(x)));
      }
    }
    notifyListeners();
  }
}
