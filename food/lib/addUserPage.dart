import 'package:flutter/material.dart';
import 'package:food/Model/food_m.dart';

class addUserPage extends StatefulWidget {
  const addUserPage({super.key,
    // required this.foodd,
    required this.onAddFood});

  // final void Function(Food food) foodd;
  final void Function(Food food) onAddFood;



  @override
  State<addUserPage> createState() => _addUserPageState();
}

class _addUserPageState extends State<addUserPage> {

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectDate;
  Category selectedCategory = Category.half ;

  void datepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    // print(pickDate);
    setState(() {
      selectDate = pickDate;
    });
  }
  void submitExpenseData() {
    final enterAmount = int.tryParse(amountController
        .text); // tryParse('Hello') => null, tryParse('1.12') => 1.12
    final amountIsInvalid = enterAmount == null || enterAmount <= 0;
    if( nameController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddFood(
      Food(
          name: nameController.text,
          amount: enterAmount,
          date: selectDate!,
          category: selectedCategory),
    );
    Navigator.pop(context);
  }
bool? isCheck = false;
Map<Category, bool> selectedCategories = {
  Category.full: false,
  Category.half: false,
};

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

// Function to handle checkbox changes
  void onCategoryChanged(Category category, bool? isSelected) {
    setState(() {
      selectedCategories[category] = isSelected ?? false;
    });
  }

  // Function to get selected categories
  List<Category> _getSelectedCategories() {
    return selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }
// Category selectedCategory = Category.half;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(label: Text('enter name')),
          ),
          Row(
            children: [
              Expanded(child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('Amount')
                ),
              )
              ),
              Spacer(),
              Text('date not select',), IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month))
    ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: Category.values.map((category) {
              return Row(
                children: [
                  Checkbox(
                    value: selectedCategories[category],
                    onChanged: (bool? isSelected) {
                      onCategoryChanged(category, isSelected);
                    },
                  ),
                  Text(category.toString().split('.').last),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             // DropdownButton(
             //   value: selectedCategory,
             //     items: Category.values.map(
             //             (category) => DropdownMenuItem(
             //                 value: category,
             //                 child : Text(category.name),)).toList() ,
             //     onChanged: (value){
             //       if(value == null){return;}
             //       setState(() {
             //         selectedCategory = value;
             //       });
             //     }),
              Spacer(),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancle')),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: (){
                    List<Category> selectedCategories = _getSelectedCategories();
                    // Here you can save or use the selected categories
                    print('Selected Categories: $selectedCategories');
                  },
                  child: Text('Save User'))
            ],
          )
        ],
      ),

    );
  }
}