import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'New Watch', amount: 159.99, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    // this locks the address but we are still allowed to modify it at runtime
    // as long as we are not reassigning
    final Transaction tx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now()
    );
    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        // lifting state up which means the common denomitor
        TransactionList(_userTransactions),
      ],
    );
  }
}
