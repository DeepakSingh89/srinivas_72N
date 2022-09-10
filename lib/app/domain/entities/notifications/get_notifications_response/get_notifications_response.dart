import 'get_notification.dart';

class GetNotificationsResponse {
  String? msg;
  List<GetNotification>? getNotification;

  GetNotificationsResponse({this.msg, this.getNotification});

  factory GetNotificationsResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationsResponse(
      msg: json['msg'] as String?,
      getNotification: (json['getNotification'] as List<dynamic>?)
          ?.map((e) => GetNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'getNotification': getNotification?.map((e) => e.toJson()).toList(),
      };
}
