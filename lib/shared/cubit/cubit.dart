import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_fondamental/modules/archive_tasks/archived_tasks.dart';
import 'package:udemy_fondamental/modules/done_tasks/done_tasks.dart';
import 'package:udemy_fondamental/modules/tasks/new_tasks.dart';
import 'package:udemy_fondamental/shared/cubit/stats.dart';
// class cubit daroi liha mn class dyal states
class AppCubit extends Cubit<AppStats>{

  // constractor kat9olo awel haja dir initiale state dyal parrent 
AppCubit () : super(AppInitialState());

// bghina nakhdo object mn had class kandiro static bach n3yto lih b smia 
// dyal class . object 
static AppCubit get(context)=> BlocProvider.of(context);
 Database? database;
 int currentIndex =0;
  bool isButtomSheetShowing =false;
  IconData buttonSheet = Icons.edit;
  List <Map> newTasks=[];
  List <Map> doneTasks=[];
  List <Map> archiveTasks=[];
  List <Widget> currentWidget = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List <String> appBartitle = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void getButtomSheetStat (
    @required bool isShowing,
    @required IconData icon,
  ){
      isButtomSheetShowing = isShowing;
      buttonSheet = icon;
      emit(ChangeButtomSheetState());
  }
  void getCurrentIndex(index){
    currentIndex =index;
    emit(ButtomNavBarState());
  }

   creatDataBase () {
      openDatabase(
       'todo.db',
       version: 1,
       onCreate: (database , version ){
         print('database created');
         // creat table in database
         database.execute('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
           print ('table creating');
         }).catchError((error){
           print ('Error when creating Table ${error.toString()}');
         });
       },
       onOpen: (database){
          getDataFromDatabase(database);
         print('database opened');
       }
     ).then((value){
        database =value ;
        emit(CreatDatabaseState());
     });
  }

  void insertToDataBase ({
    required String title,
    required String time,
    required String date,
  }) async {
   return  await database!.transaction((txn){
      database!.rawInsert('INSERT INTO Tasks (title,date,time,status) VALUES("$title","$date","$time","new")')
      .then((value) {
         print('inserted successfully');
         // ila saliti insert f data base sift wahd emit state
         emit (InsertToDatabaseState());

         // ila saliti insert dyal database item dir lih asidi get
        getDataFromDatabase(database);

      }).catchError((e){
         print('error inserting ${e.toString()}');
      });
     throw('this is error');

    });
    
  }

  void getDataFromDatabase(database){
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    emit(GetDatabaseState());
     database.rawQuery('SELECT * FROM Tasks').then((value){
      emit(GetDatabaseState());
      print (value);
        // kandir wahd loop 3la value li wslat
        // ila kan status dyal element hadi sir 7to lia fhad list
        // f screen dyali kan3yet 3la lista li bghit
        value.forEach((element){
         if(element ['status']== 'new'){
           
          newTasks.add(element);
         }else  if(element ['status']== 'done'){
           doneTasks.add(element);
         }else  {
           archiveTasks.add(element);
         }
       });
       emit(GetDatabaseState());
     });

  }

   void updatDataFromDatabase (
     {required String status,
     required int id,}
   ) {
     database!.rawUpdate(
      'UPDATE Tasks SET status = ?  WHERE id = ?',
      ['$status', id ]
    ).then((value){
      emit (UpdateDatabaseState());
      getDataFromDatabase(database);
    });
}
void deleteDataFromDatabase (
     {
     required int id,}
   ) {
     database!.rawDelete(
      'DELETE FROM Tasks WHERE id = ?',
      [ id ]
    ).then((value){
      emit (DeleteDatabaseState());
      getDataFromDatabase(database);
    });
}
}