import 'package:bytebank/components/future_delayed.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transanction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  late Future<List<Transaction>> futureTransactions;

  @override
  void initState() {
    super.initState();
    futureTransactions =delayedFetch(4,()=> findAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: futureTransactions,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Progress(message:'Error 404: Endpoint not found',icon:Icons.warning);
              }
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final transactions = snapshot.data!;
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Progress(message:'No transactions found',icon:Icons.warning);
              }
            default:
              return Progress();
          }
        },
      ),
    );
  }
}
