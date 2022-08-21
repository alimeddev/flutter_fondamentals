
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/cubit.dart';
import 'package:udemy_fondamental/shared/cubit/stats.dart';

class ArchivedTasksScreen extends StatefulWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  _ArchivedTasksScreenState createState() => _ArchivedTasksScreenState();
}

class _ArchivedTasksScreenState extends State<ArchivedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStats>(
      listener: (context, stats){},
      builder: (context, stats){
        List <Map> tasks = AppCubit.get(context).archiveTasks;
        return conditionBuildItem(tasks: tasks);
      }, 
    );

  }
}