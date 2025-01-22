import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/Data/dummy_item.dart';
import 'package:shopping_list/Model/groceries_item.dart';
import 'package:shopping_list/Widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}


class _GroceryListState extends State<GroceryList> {

  final List<GroceryItem> _groceryItem = [];

  void _addItem() async{
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => NewItemScreen()
        )
    );
    if(newItem == null){return ;}

    setState(() {
      _groceryItem.add(newItem);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Grocery'),
        actions: [
          IconButton(
              onPressed: _addItem,
              icon: Icon(Icons.add)
          )
        ],
      ),

      body: ListView.builder(
        itemCount: _groceryItem.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(_groceryItem[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItem[index].category.color,
            ),
            trailing: Text(
              _groceryItem[index].quantity.toString(),
            ),
          )
      ),
    );
  }
}
