
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/cubit.dart';
import 'package:udemy_fondamental/shared/cubit/stats.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  _NewTasksScreenState createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStats>(
      listener: (context, stats){},
      builder: (context, stats){
        List <Map> tasks = AppCubit.get(context).newTasks;
        return conditionBuildItem(tasks: tasks);
      }, 
    );
}
}