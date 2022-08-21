import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_fondamental/layout/new_home_layout.dart';
import 'package:udemy_fondamental/layout/todo_home_layout.dart';
import 'package:udemy_fondamental/modules/counter/counter.dart';
import 'package:udemy_fondamental/modules/bmi/ide_calculator.dart';
import 'package:udemy_fondamental/modules/listsongs/list.dart';
import 'package:udemy_fondamental/modules/login/login_screen.dart';
import 'package:udemy_fondamental/shared/bloc_observer.dart';
import 'package:udemy_fondamental/shared/cubit/cubit.dart';
import 'package:udemy_fondamental/shared/cubit/news_cubit.dart';
import 'package:udemy_fondamental/shared/cubit/news_stats.dart';
import 'package:udemy_fondamental/shared/local/cache_helper.dart';
import 'package:udemy_fondamental/shared/network/dio.dart';

void main ()async{
  // hta dwez hadchi li hna 3ad dir run
  WidgetsFlutterBinding.ensureInitialized();
  
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CasheHelper.init();
  bool? isDark = CasheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget{

 final  bool? isDark;
 MyApp(this.isDark);

 @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // cree lina appcubit fhad screen
          // .. kat3ni jbed lia chi object mn had class o dir lih save f varriable
          create: (BuildContext context) => AppCubit()
          ..creatDataBase()
          
          ),
          BlocProvider(
            
          // cree lina appcubit fhad screen
          // .. kat3ni jbed lia chi object mn had class o dir lih save f varriable
          create: (BuildContext context) => NewsCubit()
          ..getBusinessData()
          ..getSportsData()
          ..getSciencesData()
          ..changeAppMode(fromShared: isDark)
          
          )
      ],
      child : BlocConsumer<NewsCubit, NewsStats>(
        listener:(context,state){},
        builder: (context,state){
          return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'udemy app',
        //apply for light them
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepOrange,
            elevation: 20.0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black , size: 20.0) ,
            elevation: 0.0,
            titleSpacing: 20.0,
            titleTextStyle:  TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: false ,
            // system bar settings
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark,
            ),
          ),
          
        ),
        // dark theme settings
        darkTheme: ThemeData(
          textTheme: TextTheme(
            // text theme kankhedmo biha text 
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            // theme dyal button nav bar
            backgroundColor: Colors.grey[800],
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedItemColor: Colors.grey,
            selectedItemColor: HexColor('#EF92F0'),
            elevation: 20.0,
          ),
          scaffoldBackgroundColor: HexColor('#121212'),
          primarySwatch: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            backgroundColor: HexColor('#121212'),
            iconTheme: IconThemeData(color: Colors.white , size: 20.0) ,
            elevation: 0.0,
            titleSpacing: 20.0,
            titleTextStyle:  TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: false ,
            systemOverlayStyle: SystemUiOverlayStyle(
              // dik la bare li katkon fiha hour date batterie ... 
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.black,
              statusBarBrightness: Brightness.dark,
            ),
          ),
          
        ),
        themeMode:  NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        home: NewsHomeLayout(),
      );
        }
    )
    );
  }
}