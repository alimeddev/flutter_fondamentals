class Article {
 
  
  String title;
  String url;
  String? urlToImage;

  Article({  required this.title,required this.url,  this.urlToImage});
  
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
      
      
      title: json['title'],
      
      url: json['url'],
      urlToImage: json['urlToImage'],

      );
  }
}