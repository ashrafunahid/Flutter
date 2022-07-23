import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  Function addTransaction;
  NewTransaction(this.addTransaction);
  // String titleText;
  // String amountText;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   titleText = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              // onChanged: (value) => amountText = value,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                onPressed: submitData,
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
