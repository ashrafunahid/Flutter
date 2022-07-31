import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/CustomElevatedButton.dart';

class NewTransaction extends StatefulWidget {

  Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String titleText;
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData(){
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }
    widget.addTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }
  
  void _showDatePicker() {
    showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2015),
        lastDate: DateTime.now(),
    ).then((value) {
      if(value == null){
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleController,
                textInputAction: TextInputAction.next,
                // onSubmitted: (_) => _submitData(),
                // onChanged: (value) {
                //   titleText = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // onChanged: (value) => amountText = value,
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.11,
                child: Row(
                  children: [
                    Expanded(child: Text(_selectedDate == null ? 'No Date Choosen' : 'Purchase Date: ${DateFormat.yMd().format(_selectedDate)}')),
                    TextButton(
                        onPressed: _showDatePicker,
                        child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
              CustomElevatedButton("Add", _submitData),
            ],
          ),
        ),
      ),
    );
  }
}
