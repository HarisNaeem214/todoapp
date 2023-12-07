import 'package:flutter/material.dart';
import 'package:flutter_todo/todoldata.dart';
import "package:flutter_todo/Colors.dart";


class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {


  TextEditingController todoscontroller = TextEditingController();

   addtodo(){
   String newTodoText = todoscontroller.text;

   String newId = (todos.length +1).toString();
    Map <String,dynamic> newtodo = {
      "id" : newId,
      'todoText': newTodoText,
      'isDone': false


    };
    
      todos.add(newtodo);
      
  
   }
  
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdbGColor,
      appBar:AppBar(
        backgroundColor: tdbGColor,
        elevation: 0,
        title:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
          Icon(Icons.menu,
          color:tbBlack , 
          size: 30,),
        Container(height: 40,width: 40,
        child: ClipRRect(borderRadius: BorderRadius.circular(20),
          child: Image.asset("assets/images/nature.jpg"),
        ),)
        ],
        ),) ,
      body: Stack(
        
        children: [
          Container(

            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15
            ),
          
            child: ListView.builder(
              itemCount:todos.length ,
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ListTile(
                  
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:5 ),
                    onTap: (){
                      print("Ponka");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    tileColor: Colors.white,
                    leading: Checkbox(activeColor:Colors.black ,value: todos[index]["isDone"],
                     onChanged: (newValue){
                      setState(() {
                        todos[index]["isDone"] = newValue;
                      });
                     })
                    // Icon
                    // (    todos[index]['isDone']?  Icons.check_box : Icons.check_box_outline_blank
                    // ,color: Colors.blue,),
                    ,title: Text(todos[index]['todoText'],
                    style: TextStyle(fontSize: 16,color: Colors.black,
                    decoration:  todos[index]['isDone']? TextDecoration.lineThrough : null)// 
                    
                    ),
                    trailing: Container(height: 35,
                    width: 35,
                    decoration: BoxDecoration(color: Colors.red,
                    borderRadius: BorderRadius.circular(5)),
                    child:IconButton(onPressed: (){
                      setState(() {
                        todos.removeAt(index);
                      });

                    }, icon:Icon(Icons.delete),
                    color: Colors.white,
                    iconSize: 18,
                    
                    
                    ),
                  )),
                );
              }),
          ),
          Align(alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(child: Container(
              margin:const EdgeInsets.only(right: 20,left: 20, ),
              padding: EdgeInsets.symmetric(horizontal: 20,
              vertical: 5),
              decoration:  BoxDecoration(
                color: Colors.white,
                boxShadow:  [BoxShadow(color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 0.0),],
                borderRadius: BorderRadius.circular(10),
                

              ),
              child: TextField(
                controller: todoscontroller,
                decoration: InputDecoration(
                  hintText: "Add new todo item",
                  border: InputBorder.none,
                ),
              ) 
              
              ),
              
              
              
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20
                ),
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    addtodo();
                    todoscontroller.clear();
                  });
                }, child: Text("+",
                style: TextStyle(fontSize: 40 ),),
               ),
              )
          ],),)
        ],
      ),
    );
  }
}