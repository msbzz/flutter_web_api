import 'package:http/http.dart';

import 'package:http_interceptor/http_interceptor.dart';
 

void findAll() async {
  Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
  ]); 
  final Uri url = Uri.parse('http://192.168.0.64:8080/transactions');
 

  final Response response = await client.get(url);
  //print('>>> Response.body : ${response.body} <<<');
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('>> Request <<');
    print('>> url : ${data.baseUrl} <<');
    print('>> headers : ${data.headers} <<');
    print('>> body : ${data.body} <<');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
      print('>> Response <<');
      print('>> url : ${data.statusCode} <<');
      print('>> headers : ${data.headers} <<');
      print('>> body : ${data.body} <<');
      return data;
  }

}