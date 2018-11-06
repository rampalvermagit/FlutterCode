
class UserInfoData {
  final int userId;
  final String title;
  final String msgBody;

UserInfoData(this.title, this.msgBody, this.userId);

 UserInfoData.fromJson(Map json)
      : title = json['title'],
        msgBody = json["body"],
        userId = json["id"];

}