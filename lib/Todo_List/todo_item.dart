import 'package:app_project/Todo_List/todo_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
         onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),

        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box: Icons.check_box_outline_blank,
          color: Colors.blue,),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
                borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(onPressed: () {

            onDeleteItem(todo.id);
          },
              iconSize: 18,
              icon: Icon(Icons.delete, color: Colors.white,)),

        ),
      ),);
  }
}
