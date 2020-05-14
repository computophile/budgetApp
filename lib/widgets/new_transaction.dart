import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // text controllers
  final amountController = TextEditingController();
  final detailsController = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: detailsController,
              decoration: InputDecoration(labelText: "Details"),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            FlatButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                addTransaction(detailsController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
