import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BmiResult extends StatelessWidget {
   
   final int result;

  const BmiResult({ Key? key,required  this.result }) : super(key: key);
    
   String bmiState (int result){
     if (result < 18){
       return 'UnderWeight';
     }else if (result >= 18 && result <= 24){
       return 'Normal Weight' ;
     }else if (result >= 25 && result <= 30){
       return ' OverWeight' ;
     }else if (result > 30 && result <= 35){
       return 'Obesity Class I' ;
     }else if (result >= 36 && result <= 40){
       return 'Obesity Class II' ;
     }else if (result > 40){
       return 'Obesity Class III' ;
     }
     return 'indefined';
   } 


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon: Icon(Icons.arrow_back , color: Colors.black),
          ),
        centerTitle: true,
        title: Text('BMI Result', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.7 ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(
              'Your BMI Is ...', style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0,),
            Container(
              child: Text( '${result}' ,style : TextStyle(color: Colors.white,fontSize: 50.0 , fontWeight: FontWeight.bold)),
              color: Colors.red,
              ),

            SizedBox(height: 15.0,),
            Text(bmiState(result), style: TextStyle(color: Colors.blue, fontSize: 24.0, fontWeight: FontWeight.normal)), 
            SizedBox(height: 20.0,),
           Image(
             height: 150.0,
             image: NetworkImage('https://i.imgur.com/XKjvGpG.png'),
           ),
          ],
        ),
      ),
    );
  }
}