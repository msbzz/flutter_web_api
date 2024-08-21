
import 'package:bytebank/http/interceptors/loging_intercetor.dart';

import 'package:http/http.dart';

import 'package:http_interceptor/http_interceptor.dart';

Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

final Uri url = Uri.parse('http://192.168.0.64:8080/transactions');
