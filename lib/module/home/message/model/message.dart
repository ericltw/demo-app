import 'package:meta/meta.dart';

class Message {
  Message({
    @required this.avatar,
    @required this.title,
    @required this.content,
    @required this.time,
    @required this.number,
  });

  final String avatar;

  final String title;

  final String content;

  final String time;

  final String number;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      avatar: json['avatar'],
      title: json['title'],
      content: json['content'],
      time: json['time'],
      number: json['number'],
    );
  }
}
