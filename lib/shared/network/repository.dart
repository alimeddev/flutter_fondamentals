import 'package:udemy_fondamental/models/news_model.dart';
import 'package:udemy_fondamental/shared/network/dio.dart';

class NewsRepository {
  static Future <List<Article>> getAllArticles (
    {
      required String category,
    }
  ) async{
    final articles = await  DioHelper.getData(query: {
                  'country': 'eg',
                  'category': category,
                  'apiKey' :'61bb7f156e6049df8afb9f972b37db09',
    });
    return articles.map((article)=>Article.fromJson(article)).toList();
  }


  static Future <List<Article>> getArticleSearchData(String keyWord)async{
   final articles = await DioHelper.getSearchData(query: {
        'q': keyWord,
       'apiKey' :'61bb7f156e6049df8afb9f972b37db09',   
   });
   return articles.map((article) => Article.fromJson(article) ).toList();
  }
}