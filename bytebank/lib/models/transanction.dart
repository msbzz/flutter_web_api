import 'package:bytebank/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

    factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      json['value'],
      Contact.fromJson(json['contact']),
    );
    }

}