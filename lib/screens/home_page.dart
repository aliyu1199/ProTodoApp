import 'package:flutter/material.dart';
import 'package:pro_todo/main.dart';
import 'package:pro_todo/widget/add_todo_dialog_widget.dart';
import 'package:pro_todo/widget/completed_list_widget.dart';
import 'package:pro_todo/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
              size: 35,
            ),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 35,
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AddTodoDialogWidget()),
      ),
    );
  }
}
