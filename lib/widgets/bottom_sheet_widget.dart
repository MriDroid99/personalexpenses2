import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomShettWidget extends StatefulWidget {
  final Function(
    String id,
    String title,
    double price,
    DateTime date,
  ) addItem;
  BottomShettWidget(this.addItem, {Key? key}) : super(key: key);

  @override
  _BottomShettWidgetState createState() => _BottomShettWidgetState();
}

class _BottomShettWidgetState extends State<BottomShettWidget> {
  DateTime? _itemDate;
  var _titleController = TextEditingController();
  var _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_itemDate == null
                      ? 'Choose Date'
                      : '${DateFormat.yMMMd().format(_itemDate!)}'),
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime.now(),
                      ).then((date) {
                        setState(() {
                          _itemDate = date;
                        });
                      });
                    },
                    child: Text('Show Date'),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () => widget.addItem(
                    DateTime.now().toString(),
                    _titleController.text,
                    double.parse(_priceController.text),
                    _itemDate!),
                child: Text('Add Item'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
