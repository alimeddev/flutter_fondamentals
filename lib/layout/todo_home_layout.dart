import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/modules/archive_tasks/archived_tasks.dart';
import 'package:udemy_fondamental/modules/done_tasks/done_tasks.dart';
import 'package:udemy_fondamental/modules/tasks/new_tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:intl/intl.dart';
import 'package:udemy_fondamental/shared/cubit/cubit.dart';
import 'package:udemy_fondamental/shared/cubit/stats.dart';

class HomeNavigator extends StatelessWidget {

  
  Database? database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
 
  var titletController =TextEditingController();
  var timeController =TextEditingController();
  var dateController =TextEditingController();

 
 
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<AppCubit, AppStats>(
      // dak li ghaydir listen
      // ghaylisten 3la AppCubit li fih logique
      // o3la appstats li fih stats
      listener: (context, stats ){
        // hna kaylisten ila sme3 had stat
        // y3ni databas inserted kayhbet button sheet
        if(stats is InsertToDatabaseState){
          Navigator.pop(context);
        }
      },
      builder: (context ,stats) 
      {
        AppCubit cubit = AppCubit.get(context);
       return Scaffold(
        
        key: scaffoldKey,
        appBar:AppBar(
          title: Text(cubit.appBartitle[cubit.currentIndex], style : TextStyle(color: Colors.white)),
          
        ),
        body: ConditionalBuilder(
          condition: true,
          builder:(context)=> cubit.currentWidget[cubit.currentIndex]),
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          onPressed: () {
        
        
            if(cubit.isButtomSheetShowing){
              if(formKey.currentState!.validate()){
                cubit.insertToDataBase(
                  title: titletController.text,
                   time: timeController.text,
                    date: dateController.text
                    );
                // insertToDataBase(
                //   title: titletController.text,
                //   date: dateController.text,
                //   time: timeController.text,
                // ).then((value){
                //   Navigator.pop(context);
                //   // setState(() {
                //   //   buttonSheet =Icons.edit;
                //   //   isButtomSheetShowing =false;
                //   // });
                // });
              }
        
            }else{
              scaffoldKey.currentState!.showBottomSheet((context)
              => Container(
                color: Colors.white,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultTextFromFiled(
                            isPassowrd: false,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Email cant be empty';
                              }
                              return null;
                            },
                            controller: titletController,
                            type: TextInputType.text,
                            labelText: 'Tasks Title',
                            prefix: Icons.view_headline,
                        ),
                        SizedBox(height :20.0),
                        defaultTextFromFiled(
                          isPassowrd: false,
                          validator: (value){
                            if (value!.isEmpty){
                              return '  Time cant be empty';
                            }
                            return null;
                          },
                          controller: timeController,
                          onTap: (){
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                            ).then((value){
                              timeController.text= value!.format(context);
                            });
                          },
                          type: TextInputType.datetime,
                          labelText: 'time',
                          prefix: Icons.schedule,
                        ),
                        SizedBox(height :20.0),
                        defaultTextFromFiled(
                          isPassowrd: false,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'date cant be empty';
                            }
                            return null;
                          },
                          controller: dateController,
                          onTap: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-04-15'),
        
                            ).then((value){
                              dateController.text= DateFormat.yMMMMd().format(value!);
        
                            });
                          },
                          type: TextInputType.text,
                          labelText: 'Tasks date',
                          prefix: CupertinoIcons.calendar_today,
                        ),
                      ],
                    ),
                  ),
                ),
        
              )
        
              ).closed.then((value){
                cubit.getButtomSheetStat(false, Icons.edit);
              });
              cubit.getButtomSheetStat(true, Icons.add);
        
            }
            // try {
            //   // tsna hta trje3 ilna getData string dyalha
            //   // had lkhedma dyal tsna khaseha dar f backghround y3ni async
            //   var name = await getData();
            //   print (name);
            //   // hna dert error byedi bach njreb
            //   throw('i have an error');
            // }catch (error) {
            //   print ('error ${error.toString()}');
            // }
        
            // mochkil ila 3ndna haja ghatkhdem f main o haja ghatkhdem f back
            // main ghatsbe9 o tgles tsna o handling error ghaymred so
            // kandiro ----- then -- bla mn await ola async
            // getData().then<String>((value){
            //   // then kat3ni mli trje3 lina function value dyalha 3ad dir
            //   print (value);
            //   print ('osama');
            //   throw ('Some arbitrary error');
            // }).catchError((e){
            //   print ('this is $e');
            //   return 'fda';
            // });
        
          },
        
          child: Icon(
            cubit.buttonSheet,
          ),
          ),
          bottomNavigationBar: BottomNavigationBar(
        
            currentIndex: cubit.currentIndex,
        
            onTap:(index){
            cubit.getCurrentIndex(index);
            } ,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_outlined,
        
                ), 
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_outlined,
        
                ), 
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.archive_outlined,
        
                ), 
                label: 'Archived',
              )
            ]
            ) ,
      );
      
      }
    );
  }
  // ghadi trje3 string vallue f future inchaalah (asynch)
   Future<String> getData() async{
    return 'Ahmed Ali';
  }

  // creat & open database
  
 
}

