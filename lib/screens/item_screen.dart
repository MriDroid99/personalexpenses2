import 'package:flutter/material.dart';

// Model
import '../models/item.dart';

// Widget
import '../widgets/item_widget.dart';
import '../widgets/bottom_sheet_widget.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({Key? key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final List<Item> _items = [];

  void removeItem(String id) {
    setState(() {
      _items.removeWhere(
        (item) => item.id == id,
      );
      print(_items.length);
    });
  }

  void addItem(
    String id,
    String title,
    double price,
    DateTime date,
  ) {
    Navigator.pop(context);
    setState(() {
      _items.add(Item(
        id: id,
        title: title,
        price: price,
        date: date,
      ));
    });
  }

  Future showSheet(BuildContext ctx) {
    return showModalBottomSheet(
      context: ctx,
      builder: (_) => Card(
        child: BottomShettWidget(addItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _items.length == 0
            ? Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/waiting.png',
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (_, index) => ItemWidget(
                  _items[index].id,
                  _items[index].title,
                  _items[index].price,
                  _items[index].date,
                  removeItem,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
