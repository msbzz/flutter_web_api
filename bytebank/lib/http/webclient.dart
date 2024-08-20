import 'dart:convert';
import 'dart:ffi';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transanction.dart';
import 'package:http/http.dart';

import 'package:http_interceptor/http_interceptor.dart';

Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

final Uri url = Uri.parse('http://192.168.0.64:8080/transactions');

Future<List<Transaction>> findAll() async {
  final Response response = await client.get(url).timeout(Duration(seconds: 4));

  final List<dynamic> decodedJson = jsonDecode(response.body);

  final List<Transaction> transactions = [];

  for (var json in decodedJson) {
    transactions.add(Transaction.fromJson(json));
  }

  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber
    }
  };

  final String transactionJson = jsonEncode(transactionMap);

  final response = await client.post(url,
      headers: {'Content-type': 'application/json', 'password': '1000'},
      body: transactionJson);

  print('>>> response <<<');
  print('>>> ${response.toString()} <<<');

  Map<String, dynamic> responseJson = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = responseJson['contact'];

  print('contactJson >>> ${contactJson.toString()}');

  return Transaction(
    responseJson['value'],
    Contact(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}

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
