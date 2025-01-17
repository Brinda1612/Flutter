import 'package:flutter/material.dart';
import 'package:food/addUserPage.dart';
import 'package:food/food_list.dart';
import 'package:food/main.dart';

import 'Model/food_m.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final List<Food> registerUser = [
    Food(
        name: 'Brinda',
        amount: 40,
        category: Category.half,
        date: DateTime.now()
    ),
    Food(name: 'Nensi', amount: 60, category: Category.full, date: DateTime.now()),
  ];

  int _selectedIndex = 0;
  // List of widget options for each tab
  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void openAddUser() {
    showModalBottomSheet(
      useSafeArea: true,
      // It cover a whole Screen
      isScrollControlled: true,
      context: context, builder: (context) => addUserPage(onAddFood: addFood),
    );
  }

  void addFood(Food food){
    registerUser.add(food);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
       actions: [
         IconButton(
             onPressed: openAddUser,
             icon: Icon(Icons.add, color: Colors.white,)),
       ],
      ),
      body: Column(
        children: [
          // Text('hiii'),
          Expanded(child: foodList(food: registerUser, onRemoveExpense: (Food food) {  },)),
        ],
      ),


      //  bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex, // Highlight the selected tab
      //   onTap: _onItemTapped, // Handle tab selection
      // ),
    );
  }
}