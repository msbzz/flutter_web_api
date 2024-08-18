import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/transanctions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 16.0),
              children: <Widget>[
                _FutureItem(
                  name: 'Transfer',
                  icon: Icons.monetization_on,
                  onClick: () => _showContactList(context),
                ),
                _FutureItem(
                  name: 'Transaction Feed',
                  icon: Icons.description,
                  onClick: () => _showTransactions(context),
                ),
          
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactsList(),
      ),
    );
  }
}

void _showTransactions(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
}

class _FutureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FutureItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
