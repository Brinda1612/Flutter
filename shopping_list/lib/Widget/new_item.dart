import 'package:flutter/material.dart';
import 'package:shopping_list/Model/category_m.dart';
import 'package:shopping_list/Model/groceries_item.dart';
import '../Data/category.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enterName = '';
  var _enterQuantity = 1;
  var _selectCategory = categories[Categories.vegetables];


  void _saveItem() {
    if(_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    Navigator.of(context).pop(
      GroceryItem(
          id: DateTime.now().toString(),
          name: _enterName,
          quantity: _enterQuantity,
          category: _selectCategory!)
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(label: Text('Name')),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1){
                      return 'Enter valid Name';}
                    return null;
                  },
                  onSaved: (value){
                    _enterName = value!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Quantity'),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue: '1',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0)
                            return 'Enter valid Quantity';
                        },
                        onSaved: (value){
                          _enterQuantity = int.parse(value!);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _selectCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(category.value.title),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                           _selectCategory = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: Text('Reset')),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: _saveItem, child: Text('Add Item'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
//
// AlertDialog(
//
// title: Text("Add New Item"),
// content: TextField(
// decoration: InputDecoration(
// labelText: "Enter item name",
// ),
// ),
//
// actions: [
// TextButton(
// onPressed: () {
// // Close the popup
// Navigator.of(context).pop();
// },
// child: Text("Cancel"),
// ),
//
// TextButton(
// onPressed: () {
// // Perform your action
// Navigator.of(context).pop();
// },
// child: Text("Add"),
// ),]
// );
