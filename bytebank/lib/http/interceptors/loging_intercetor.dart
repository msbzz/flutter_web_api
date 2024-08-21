 

import 'package:http_interceptor/http_interceptor.dart';


class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // Aqui você pode adicionar logs ou manipular a requisição antes de enviá-la
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode >= 400) {
      throw HttpExceptionWithStatus(
          data.statusCode, data.body ?? 'Erro desconhecido');
    }
    return data;
  }
}

// Definindo uma exceção customizada para capturar o código de status HTTP
class HttpExceptionWithStatus implements Exception {
  final int statusCode;
  final String message;

  HttpExceptionWithStatus(this.statusCode, this.message);

  @override
  String toString() {
    return 'HttpExceptionWithStatus(statusCode: $statusCode, message: $message)';
  }
}
