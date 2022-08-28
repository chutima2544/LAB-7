import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String result = "0";

  buttonPressed(String value){

    setState(() {
      if( value == "CLEAR" ){
        result = "0";
      } else if ( value == "." ){

        if(result.contains(".")){
          return;
        } else {
          result = result + value;
        }

      } else if ( value == "=" ){

      } else {

        if( result == "0" ){
          result = value;
        } else {
          result = result + value;
        }
      }
    });
  }

  Widget myButton(String buttonLabel){
    return Expanded (
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonLabel),
        child: Text(buttonLabel,
          style: TextStyle(fontSize: 30),),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 24),
                alignment: Alignment.centerRight,
                child: Text(result,
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              ),
        
              Expanded(child: Divider()),
        
              Column(
                children: [
                  Row(
                children: [
                   myButton("7"),
                   myButton("8"),
                   myButton("9"),
                   myButton("/"),
                ],
              ),
        
              Row(
                children: [
                   myButton("4"),
                   myButton("5"),
                   myButton("6"),
                   myButton("x"),
                ],
              ),
        
              Row(
                children: [
                   myButton("1"),
                   myButton("2"),
                   myButton("3"),
                   myButton("-"),
                ],
              ),
        
              Row(
                children: [
                   myButton("."),
                   myButton("0"),
                   myButton("00"),
                   myButton("+"),
                ],
              ),
        
              Row(
                children: [
                   myButton("CLEAR"),
                   myButton("="),                
                ],
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}