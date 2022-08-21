import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/news_cubit.dart';
import 'package:udemy_fondamental/shared/cubit/news_stats.dart';

class BuisnessScreen extends StatelessWidget {
  const BuisnessScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStats>(
       listener: (context,state){},
      builder: (context ,state){
        var businessItem = NewsCubit.get(context).business;
        return  ListArticles(articles: businessItem ); 
      },
      );
  }
}