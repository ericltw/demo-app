import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import './message_http_client.dart';

class MessageService {
  final MessageHttpClient client;

  static const String hostname = 'http://10.0.2.2:3000';

  MessageService({
    @required this.client,
  });

  Future<Map<String, dynamic>> getMessages() async {
    final Response response = await client.get(
      hostname + '/messages',
    );

    List<dynamic> body = json.decode(response.body);

    switch (response.statusCode) {
      case 200:
        return {
          'status': 'success',
          'messages': body,
        };
        break;
      default:
        return null;
    }
  }
}
