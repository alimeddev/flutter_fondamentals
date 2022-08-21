
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/cubit.dart';
import 'package:udemy_fondamental/shared/cubit/stats.dart';

class DoneTasksScreen extends StatefulWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  _DoneTasksScreenState createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStats>(
      listener: (context, stats){},
      builder: (context, stats){
        List <Map> tasks = AppCubit.get(context).doneTasks;
        return conditionBuildItem(tasks: tasks);
      }, 
    );
}
  
}