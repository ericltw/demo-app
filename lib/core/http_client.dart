import 'package:http/http.dart';

abstract class HttpClient extends BaseClient {
  final Client _inner = Client();

  void onSend(BaseRequest request);
  void onSuccess();
  void onError();

  Future<StreamedResponse> send(BaseRequest request) async {
    StreamedResponse response;

    // Do something before request.
    onSend(request);

    try {
      response = await _inner.send(request);

      // Do something after getting a response.
      onSuccess();
    } catch (e, s) {
      // Do something after getting a response.
      onError();
      print(e);
      print(s);
      rethrow;
    }

    return response;
  }
}
