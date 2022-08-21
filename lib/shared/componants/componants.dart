
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:udemy_fondamental/models/news_model.dart';
import 'package:udemy_fondamental/modules/web_view/web_view.dart';
import 'package:udemy_fondamental/shared/cubit/cubit.dart';

Widget defaultTextFromFiled (
{
  required TextEditingController? controller,
  required TextInputType type,
  //Function onSubmit,
  required String labelText,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isPassowrd =false,
  VoidCallback? onTap,
  String? Function(String?)? validator,
  Function(String?)? onChange,
}
    )
    {

  return  TextFormField(
    onTap: onTap ,
    onChanged: onChange,
    validator: validator,
    controller: controller,
    keyboardType: type,
    obscureText: isPassowrd,
    //onFieldSubmitted: onSubmit,
    //onChanged: (){},
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix !=null ? IconButton(onPressed:suffixPressed, icon: Icon(suffix),): null,
      border: OutlineInputBorder(),
      
    ),
  ) ;
}
Widget defaulteButton ({
   double width = double.infinity,
  Color color =Colors.blue,
  required VoidCallback? onPressed,
  required String text,
}){
  return Container(
                    width: width,
                    color: color,
                    child: MaterialButton(
                      onPressed: onPressed,
                      child: Text(text , style: TextStyle(color: Colors.white, fontSize: 24.0,),),
                      ),
                  );
}

Widget buildItemSceen (
  Map model,
  context,
){
  return Dismissible(
    key: Key(model['id'].toString()),
    onDismissed: (direction){
      AppCubit.get(context).deleteDataFromDatabase(id: model['id']);
    },
    child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 34.0,
              child: Text(model['time']),
            
            ),
            SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model['title'], style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 24.0)),
                  SizedBox(height: 6.0,),
                  Text(model ['date'], style:TextStyle(color: Colors.black38,fontSize: 20.0)),
                ],
              ),
            ),
            Row (
              children: [
                IconButton(onPressed:(){
                  AppCubit.get(context).updatDataFromDatabase(
                     status: 'done',
                     id: model['id'],
                     );
                },
                 icon: Icon(Icons.check_box, color: Colors.green[200],)),
                
                IconButton(onPressed:(){
                  AppCubit.get(context).updatDataFromDatabase(
                    status: 'archive', id: model['id']);
                  
                }, icon: Icon(Icons.archive, color: Colors.black87)),
            
              ],
            )
          ],
        ),
      ),
  );
}
Widget conditionBuildItem (
  {required List <Map> tasks}
){
  return ConditionalBuilder(
    condition: tasks.length>0,
    builder: (context)=> ListView.separated(
        itemBuilder: (context, index)=> buildItemSceen(tasks[index], context),
        separatorBuilder:(context ,index)=> myDevider(),
        itemCount: tasks.length,
        ),
    fallback:(context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_outlined,
            size: 45.0,
            color: Colors.grey[300],
    
          ),
          Text('The Tasks is Empty Please add some Tasks',
          style: TextStyle(color: Colors.grey[500],fontSize: 15.0,fontWeight: FontWeight.bold),
          )
        ],
      ),
    )  ,
  );
}
Widget buildArticleItem(
  Article article,
  BuildContext context,
  
){
  return  Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment : MainAxisAlignment.start,
      
      children: [
        Column(   
          mainAxisAlignment : MainAxisAlignment.start,
            
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage!),
                  fit: BoxFit.cover,
                )
              )
              ),
              SizedBox(height: 8.0,),
            Text('2021-10-21-10:05', style: TextStyle(color: Colors.grey),)
          ],
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Container(
            height: 155.0,
            child: Column(
              mainAxisSize:  MainAxisSize.min,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                   style: Theme.of(context).textTheme.bodyText1,
                   textDirection: TextDirection.rtl,
                   maxLines: 3,
                   overflow: TextOverflow.ellipsis,
                   ),
                SizedBox(height:12.0,),
                Expanded(child: TextButton(onPressed: (){
                  navigateTo(context, WebViewScreen(url: article.url));
                }, child: Text('read more')))
              ],
            ),
          ),
        )
      ],
    ),
    );
}
Widget myDevider (){
  return Container(height: 1.0, width: double.infinity,color: Colors.blue.withOpacity(0.3));
}
Widget ListArticles(
  {required List articles}
){
return ConditionalBuilder(
  condition: articles.length > 0,
  builder: (context)=> ListView.separated(
      
       physics: BouncingScrollPhysics(),
       // when refresh page style
      itemBuilder: (context,index)=> buildArticleItem(articles[index], context),
      separatorBuilder: (context,index)=> myDevider(),
       itemCount: articles.length,
       ),
  fallback: (context)=> Center(child: CircularProgressIndicator()),     
);
}
void navigateTo(context, Widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}