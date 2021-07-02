import 'package:team_intl_challenge/network/http_client.dart';

abstract class HttpDao<T> {
  HttpClient client = HttpClient.getInstance();
}
