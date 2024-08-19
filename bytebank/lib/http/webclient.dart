import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transanction.dart';
import 'package:http/http.dart';

import 'package:http_interceptor/http_interceptor.dart';

Future<List<Transaction>> findAll() async {
  Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
  ]); 
  final Uri url = Uri.parse('http://192.168.0.64:8080/transactions');
 
  final Response response = await client.get(url);

  final List<dynamic> decodedJson = jsonDecode(response.body);
  // Inicializando a lista de transações corretamente
  final List<Transaction> transactions = [];

  // Mapeando o JSON decodificado para objetos do tipo Transaction
  for (var json in decodedJson) {
    transactions.add(Transaction.fromJson(json));
  }
  
  return transactions;  
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // print('>> Request <<');
    // print('>> url : ${data.baseUrl} <<');
    // print('>> headers : ${data.headers} <<');
    // print('>> body : ${data.body} <<');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // print('>> Response <<');
    // print('>> url : ${data.statusCode} <<');
    // print('>> headers : ${data.headers} <<');
    // print('>> body : ${data.body} <<');
    return data;
  }
}
