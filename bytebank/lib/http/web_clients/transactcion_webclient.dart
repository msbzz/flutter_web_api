import 'dart:convert';
import 'package:http/http.dart';

import 'package:bytebank/http/webclient.dart';

import 'package:bytebank/models/transanction.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(url).timeout(const Duration(seconds: 4));

    final List<dynamic> decodedJson = jsonDecode(response.body);
     
    return  decodedJson.map((dynamic json)=> Transaction.fromJson(json)).toList();

    // final List<Transaction> transactions = [];

    // for (var json in decodedJson) {
    //   transactions.add(Transaction.fromJson(json));
    // }
    // return transactions;
   
  }

  Future<Transaction> save(Transaction transaction) async {
    final Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionMap);
    final response = await client.post(url,
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson);

        //return _toTransaction(response);
        return Transaction.fromJson(jsonDecode(response.body));
    
  }
  
  Map<String, dynamic> _toMap(Transaction transaction) {
    return {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber
      }
    };

  }
  
  // Transaction _toTransaction(Response response) {
  //   Map<String, dynamic> responseJson = jsonDecode(response.body);
  //   final Map<String, dynamic> contactJson = responseJson['contact'];

  //   return Transaction(
  //     responseJson['value'],
  //     Contact(
  //       0,
  //       contactJson['name'],
  //       contactJson['accountNumber'],
  //     ),
  //   );
  // }

}
