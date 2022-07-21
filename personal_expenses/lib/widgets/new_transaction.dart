import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  Function addTransaction;
  NewTransaction(this.addTransaction);
  // String titleText;
  // String amountText;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              // onChanged: (value) {
              //   titleText = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              // onChanged: (value) => amountText = value,
              controller: amountController,
            ),
            TextButton(
                onPressed: (){
                  addTransaction(
                    titleController.text,
                    double.parse(amountController.text),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text("Add")
            ),
          ],
        ),
      ),
    );
  }
}
