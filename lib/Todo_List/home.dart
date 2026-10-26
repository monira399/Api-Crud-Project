import 'package:app_project/Todo_List/todo_item.dart';
import 'package:app_project/Todo_List/todo_variable.dart';
import 'package:flutter/material.dart';


class HomePage2 extends StatefulWidget {
   HomePage2 ({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final todoList = ToDo.todoList();
  List<ToDo>_foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),

                Expanded(
                  child: ListView(
                    children: [Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text('All ToDos',
                      style: TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.w500,
                      ),

                      ),

                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Row(
                    //     children: [
                    //       Expanded(child: Container(
                    //         margin:EdgeInsets.only(
                    //           bottom: 20,
                    //           top: 20,
                    //           left:20,
                    //         ),
                    //         padding: EdgeInsets.symmetric(
                    //           horizontal: 20,
                    //           vertical: 5,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //          boxShadow: [BoxShadow(
                    //            color: Colors.grey,
                    //            offset: Offset(0, 0),
                    //            blurRadius: 10.0,
                    //            spreadRadius: 0.0,
                    //          ),],
                    //           borderRadius: BorderRadius.circular(10),
                    //           ),
                    //         child: TextField(
                    //           controller: _todoController,
                    //           decoration: InputDecoration(
                    //             hintText: 'add a new todo',
                    //             border: InputBorder.none,
                    //           ),
                    //         ),
                    //         ),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(
                    //           bottom: 20,
                    //           right: 20,
                    //         ),
                    //         child: ElevatedButton(onPressed: (){
                    //           _addToDoItem(_todoController.text);
                    //         },
                    //             child: Text('+', style: TextStyle(fontSize: 40),),
                    //         style:ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.blue,
                    //           minimumSize: Size(60, 60),
                    //           elevation: 10
                    //         ),),
                    //       )
                    //     ],
                    //
                    //   ),
                    // ),
                    for ( ToDo todo in _foundToDo.reversed)

                    ToDoItem(todo: todo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,
                    ),

                    ],

                  ),
                ),
              ],
            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin:EdgeInsets.only(
                    bottom: 20,
                    top: 20,
                    left:20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'add a new todo',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(onPressed: (){
                    _addToDoItem(_todoController.text);
                  },
                    child: Text('+', style: TextStyle(fontSize: 40),),
                    style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(60, 60),
                        elevation: 10
                    ),),
                )
              ],

            ),
          ),
        ],

      ),

    );
  }

  void _runFilter(String enterKeyword){
    List<ToDo> results = [];
    if(enterKeyword.isEmpty){
      results = todoList;
    }else{
      results = todoList
          .where((item) => item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }



  void _addToDoItem(String toDo){
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);

    });
  }
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black54,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(
            Icons.menu,
        color: Colors.black54,
        size:30 ,),
        Container(
          height: 60,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),



            child: Image.asset('asset/img.png'),
          ),
        )
      ],),
    );
  }
}
