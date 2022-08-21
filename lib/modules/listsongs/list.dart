import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:udemy_fondamental/models/model_clas.dart';

class ListPage extends StatelessWidget {
  
 List <Songs> songs =[
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
      Songs (
        title: 'kolchi baghi iwli baplo',
        singer: 'elgandetoto',
        imageUrl: 'https://static.allodocteurs.africa/btf-12-1109-thumb-660/2d4cf42cd5c518f1f9b105660646a6d7/media.jpg',
      ),
    ];
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title:Center(
          child: Text(
            'Big Songs',
            style: TextStyle(
              color: Colors.black,
            ),
            )
            ),
        elevation: 2.0,
        backgroundColor: Colors.white,
        ),
        body : ListView.builder(
          itemCount:songs.length,
          // this function build item index i 
          itemBuilder: (context , index) => buildItemSongs(songs[index]),
          
          )
          
        
      );  
  }

  Widget buildItemSongs (Songs song){
    return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.yellow,
                    ),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(song.imageUrl),

                    ),
                  ),
                  CircleAvatar(
                    radius: 10.0,
                    child: Icon(
                      Icons.play_circle
                      
                    ),
                  )
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( 
                      song.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                      ),
                    ),
                    SizedBox(height:5),
                    Text(
                      song.singer,
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 13.0
                    ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.share,
                color: Colors.blue,
              ),
            ],
          ),
        ) ;
  }
}