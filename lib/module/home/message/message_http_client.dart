import 'package:http/http.dart';

import '../../../core/http_client.dart';

class MessageHttpClient extends HttpClient {
  void onSend(BaseRequest request) {
    request.headers['Content-type'] = 'application/json';
  }

  void onSuccess() {}

  void onError() {}
}
