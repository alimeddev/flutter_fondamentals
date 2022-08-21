import 'package:flutter/material.dart';
import 'package:udemy_fondamental/shared/componants/componants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final emailController =TextEditingController();
  final passwordController =TextEditingController(); 
  final formKey = GlobalKey<FormState>();
   bool isPassword =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  'Login',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40,),
              defaultTextFromFiled(
                validator: (value){
                   if (value!.isEmpty){
                   return 'Email cant be empty';
                   } 
                   return null ; 

                },
                controller: emailController,
                type: TextInputType.emailAddress,
                labelText: 'Email',
                prefix: Icons.email ,
                ),
                SizedBox(height: 20,),
                defaultTextFromFiled(
                  validator:(value){
                     if(value!.isEmpty){
                        return 'passowrd cant be empty';
                    } 
                     return null ;
                  } ,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  isPassowrd: isPassword,
                  labelText: 'Password',
                  prefix: Icons.password,
                  suffixPressed: (){
                     setState(() {
                       isPassword =!isPassword;
                     });
                  },
                  suffix: isPassword ? Icons.visibility_off : Icons.visibility ,
                  ),
                  SizedBox(height: 20,),
                  defaulteButton(
                     onPressed: (){
                       if(formKey.currentState!.validate()){

                       print (emailController.text);
                       print(passwordController.text);
                       }
                     } ,
                     text: 'Login',
                     ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('I dont Have Account'),
                      SizedBox(width: 5,),
                      
                      TextButton(onPressed: (){},child: Text('Register'),)
                    ],
                  ),
        
                ],
              ),
            ),
            
          ),
        ),
        
      ),
    );
  }
}
