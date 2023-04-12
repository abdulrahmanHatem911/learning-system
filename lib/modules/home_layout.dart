import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/modules/Archive_Tasks.dart';
import 'package:learning/modules/Done_Tasks.dart';
import 'package:learning/modules/New_Tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import '../components.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
int currentIndex=0;
List<Widget> screens=[NewTask(),DoneTask(),ArchiveTask()];
Database? database;
var scaffoldKey=GlobalKey<ScaffoldState>();
bool bottomsheetshown=false;
var bottomsheeticon=Icon(Icons.add);
var titleController=TextEditingController();
var timeController=TextEditingController();

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
super.initState();
CreateDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Todo App "),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(bottomsheetshown){
            Navigator.pop(context);
            bottomsheetshown=false;
            setState(() {
              bottomsheeticon=Icon(Icons.add);
            });
          }else{
            setState(() {
              bottomsheeticon=Icon(Icons.edit);
            });
             scaffoldKey.currentState?.showBottomSheet((context) =>
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
               mainAxisSize: MainAxisSize.min,
             children: [
               TextFormField(
                   controller:titleController,
                   decoration:InputDecoration(
                     labelText: 'Task title',
                     border: OutlineInputBorder(),
                     prefixIcon:Icon(Icons.title),
                   ),
                   validator:( String? value){
                     if (value!.isEmpty){
                       return 'title must not be empty';
                     }
                       return null;
                   } ,
               ),
               SizedBox(height: 15,),
               TextFormField(
                   controller:timeController,
                   decoration:InputDecoration(
                     labelText: 'time',
                     border: OutlineInputBorder(),
                     prefixIcon:Icon(Icons.timer),
                   ),
                   validator:( String? value){
                     if (value!.isEmpty){
                       return 'time must not be empty';
                     }
                   } ,
                 onTap: (){
                     showTimePicker(context: context,
                         initialTime:TimeOfDay.now()).then((Value)
                         {
                           timeController.text=Value!.format(context).toString();
                         });
                 },
               ),
             ],
            ),
                 ));
            bottomsheetshown=true;


          }
         },
        child: bottomsheeticon,
    ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
      onTap: (index){
          setState(() {
            currentIndex=index;
          });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu),
          label: 'menu',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.done),
          label: 'Done',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),
          label: 'Acrchive',
        ),
      ],
      )


    );
  }
  String getName() {
    var name ='ahmed';
    return name;
  }
  void CreateDatabase()async{
     database= await openDatabase(
      'Todo.dp',
      version: 1,
      onCreate: (Database,version){
        Database.execute('CREATE TABLE tasks(id PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value) {
          print('data base created');
        }).catchError((error){
          print('error when creating database ${error.toString()}');
        });
        },
      onOpen: (Database){
        print('database opened');
      },

    );
  }
  void inserttodatabase()async{
    database!.transaction((txn) async{
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("first task ","352","41s","new") ').then((value)
      {print('$value inserted succefully');});

      }).catchError((error){
        print('erorr when creating raws ${error.toString()}');;
      throw '' ;
    });
  }
}
