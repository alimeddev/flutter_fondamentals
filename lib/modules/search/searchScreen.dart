import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';
import 'package:udemy_fondamental/shared/cubit/news_cubit.dart';
import 'package:udemy_fondamental/shared/cubit/news_stats.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final searchController =TextEditingController();
    
    return BlocConsumer<NewsCubit,NewsStats>(
      listener: (context,state){},
      builder: (context,state){
        List search =NewsCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[300],
                ),
                child: defaultTextFromFiled(
                  controller: searchController,
                  onChange: (keyWord){
                    NewsCubit.get(context).getSearchData(keyWord);
                  }, 
                  type: TextInputType.text , 
                  labelText: 'search', 
                  prefix: Icons.search,
                  validator: (value){
                   if(value!.isEmpty){
                     return 'search can not be empty';
                   }else {
                     return null;
                   }
                   
                  }
                  ),
              ),
            ),
            Expanded(child: ListArticles(articles: search))
          ],
        ),
    
      );
      }, 
    );
  }
}