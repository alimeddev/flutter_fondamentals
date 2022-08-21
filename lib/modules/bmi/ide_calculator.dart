import 'package:flutter/material.dart';
import 'package:udemy_fondamental/modules/bmi/bmi_result.dart';

class CalculatorPage extends StatefulWidget {
 

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}
 
 
class _CalculatorPageState extends State<CalculatorPage> {
  bool isFemale = false;
  double height =120.0;
  double? result;
  int age = 20;
  double weight = 40;
  
  @override
 void initState(){
   super.initState();
   isFemale =false;
 }
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI calculator', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.7 ,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isFemale = false;
                          });
                        },
                        child: Container(
                           decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: !isFemale ? Colors.red : Colors.grey,
                            ),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                height: 50.0,
                                image: NetworkImage('https://i.imgur.com/Zdx5hcq.png'),
                              ),
                              SizedBox(height: 10,),
                              Text ('MALE', style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isFemale = true ;
                          });
                        },
                        child: Container(
                          
                           decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: isFemale ? Colors.red : Colors.grey,
                            ),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [ 
                              Image(
                                height: 50.0,
                                image: NetworkImage('https://i.imgur.com/vIfThnQ.png'),
                              ),
                              SizedBox(height: 10,),
                              Text ('FEMALE', style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal : 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}', style: TextStyle(color: Colors.black87, fontSize: 45.0, fontWeight: FontWeight.w700),),
                        SizedBox(width: 8.0,),
                        Text('cm' , style: TextStyle(color: Colors.black87, fontSize: 15.0, fontWeight: FontWeight.w700),),
                      ],
                    ),
                    SizedBox(width: 8.0,),
                    Slider(
                      inactiveColor: Colors.yellow,
                      activeColor: Colors.red,          
                      value: height,
                      min: 115,
                      max: 220,
                      onChanged: (value){
                        setState(() {
                          height = value;
                        });
                      }
                      )

                  
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row (
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text ('AGE', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Text('${age}' , style: TextStyle(color: Colors.black87, fontSize: 40.0, fontWeight: FontWeight.w700),),
                            Row (
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true ,
                                  child: Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true ,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text ('WEIGHT', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Text('${weight}' , style: TextStyle(color: Colors.black87, fontSize: 40.0, fontWeight: FontWeight.w700),),
                            Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true ,
                                  child: Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true ,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.yellow,
            child: OutlinedButton(
              onPressed: (){
                result = weight / (height *height /10000);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context)=>BmiResult(
                    result: result!.round(),
                  ))
                   );
              },
              child: Text('Calculate'),
              style: OutlinedButton.styleFrom(
                primary: Colors.red,
               
              ),
              ),
          )
        ],
      ),
    );
  }
}