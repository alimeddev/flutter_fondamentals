import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/news_cubit.dart';
import 'package:udemy_fondamental/shared/cubit/news_stats.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStats>(
      listener: (context,state){},
      builder: (context,state){
        List sport = NewsCubit.get(context).sport;
        return ListArticles(articles: sport);
      },
    ); 
  }
}