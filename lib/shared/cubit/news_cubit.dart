import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_fondamental/models/news_model.dart';
import 'package:udemy_fondamental/modules/buisness/buisness.dart';
import 'package:udemy_fondamental/modules/science/science.dart';
import 'package:udemy_fondamental/modules/sport/sport.dart';
import 'package:udemy_fondamental/shared/cubit/news_stats.dart';
import 'package:udemy_fondamental/shared/local/cache_helper.dart';
import 'package:udemy_fondamental/shared/network/dio.dart';
import 'package:udemy_fondamental/shared/network/repository.dart';

class NewsCubit extends Cubit<NewsStats>{

   NewsCubit(): super(NewsInitialState());

   static NewsCubit get(context) => BlocProvider.of(context);

   int navBarIndex =0;
   bool isDark = false;

   List<Article> business =[];
   List<Article> sport =[];
   List<Article> science =[];
   List<Article> search =[];
   
   String? keyWord;
   String noImage ='https://bit.ly/3vsQoCs';

    List<Widget> screens =[
     BuisnessScreen(),
     SportScreen(),
     ScienceScreen(),
   ];

   void getNewsIndex(index){
     navBarIndex = index;
     emit(ButtonNavigationState());
   }
  
   List<BottomNavigationBarItem> navItems =[
     BottomNavigationBarItem(
       icon: Icon(
         Icons.monetization_on,

       ),
       label: 'Business', 
     ),
     BottomNavigationBarItem(
       icon: Icon(
         Icons.sports_kabaddi_outlined,

       ),
       label: 'Sport', 
     ),
      BottomNavigationBarItem(
       icon: Icon(
         Icons.science_rounded
       ),
       label: 'Science', 
     ),
   ];
   
   void getBusinessData(){
     emit(NewsBusinessLoadingStat());
      NewsRepository.getAllArticles(
        category: 'business',
      )
      .then((value){
        print(value);
        getImagIfNull(value);
         business =value;
         emit(NewsBusinessSuccessStat());
      }).catchError((e){
        print(e.toString());
        emit(NewsBusinessErrorStat(e.toString()));
      });
   }
    void getSportsData(){
     emit(NewsSportLoadingStat());
      NewsRepository.getAllArticles(
        category: 'sport',
      )
      .then((value){
        print(value);
        getImagIfNull(value);
         sport =value;
         emit(NewsSportSuccessStat());
      }).catchError((e){
        print(e.toString());
        emit(NewsSportErrorStat(e.toString()));
      });
   }
   
   void getSciencesData(){
     emit(NewsScienceLoadingStat());
      NewsRepository.getAllArticles(
        category: 'science',
      )
      .then((value){
        print(value);
        getImagIfNull(value);
         science =value;
         emit(NewsScienceSuccessStat());
      }).catchError((e){
        print(e.toString());
        emit(NewsScienceErrorStat(e.toString()));
      });
   }
   
   void getSearchData(String? keyWord){
     emit(NewsSearchLoadingStat());
     NewsRepository.getArticleSearchData(
       keyWord!,
     )
     .then((value){
      search = value;
      this.keyWord=keyWord;
      emit(NewsSearchSuccessStat());
     }).catchError((error){
       print(error.toString());
       emit(NewsSportErrorStat(error.toString()));
     });
   }

   void getImagIfNull (List<Article> articles){
     articles.forEach((article) {
       if (article.urlToImage ==  null) {
          article.urlToImage= noImage;
       }
     });
   }
   void changeAppMode({bool? fromShared}){
     if(fromShared!=null){
       isDark= fromShared;
     }else{
       isDark =!isDark;
       
     // sift lina had key o vallue l sharepref bach tsava
        CasheHelper.setBoolean(key: 'isDark', value: isDark)
       .then((value){
      // hta idir save lkey o value 3ad dir lina emit l state dyal chane app mode
        emit(ChangeNewsAppMode());
     });
     }
   }
}