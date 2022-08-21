import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({ Key? key }) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
  }

 
class _CounterPageState extends State<CounterPage> {
  var value =1;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('udemy app'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
               setState(() {
                  value --;
                print(value);
               });
              },
              child: Text(
                'decrement',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Text('$value' ,style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
            SizedBox(width: 20,),
            TextButton(
              onPressed: (){
                setState(() {
                  value ++;
                print(value);
                });
              },
              child: Text(
                'incriment',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}