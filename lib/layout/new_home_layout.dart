import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/modules/search/searchScreen.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/news_cubit.dart';
import 'package:udemy_fondamental/shared/cubit/news_stats.dart';
import 'package:udemy_fondamental/shared/network/dio.dart';

class NewsHomeLayout extends StatelessWidget {
  const NewsHomeLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStats>(
      listener: (BuildContext context, NewsStats stats){},
      builder:(context ,stats){
        var newsCubit =NewsCubit.get(context);
        return Scaffold(
        
        appBar: AppBar(
          title :Text('News App'),
          actions: [
            IconButton(onPressed: (){
              navigateTo(context, SearchScreen());
            }, icon:Icon(Icons.search),),
             IconButton(onPressed: (){
               newsCubit.changeAppMode();
             }, icon:Icon(Icons.mode_night_rounded),),
          ],
        ),  
        body: newsCubit.screens[newsCubit.navBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: newsCubit.navItems,
          currentIndex: newsCubit.navBarIndex ,
          onTap: (index){
            newsCubit.getNewsIndex(index);        
          } ,
          ),     
      );
      }
    );
  }
}