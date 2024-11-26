import 'package:calculatorapp/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

   var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 176, 238),
      appBar: AppBar(title: Text("Calculator",style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Column(
        children: [
          Expanded(child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(userQuestion,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(userAnswer,style: TextStyle(color: const Color.fromARGB(255, 29, 17, 28),fontSize: 22,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 30,),
              Expanded(child: GridView.builder(
                itemCount: buttons.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  
                  crossAxisCount: 4,crossAxisSpacing: 2,mainAxisSpacing: 2),
                   itemBuilder: (context,index){
                    
                    if(index==0){
                      return ButtonS(
                        
                        color: Colors.green,
                       textColor: Colors.black,
                        buttonText:buttons[index],
                         buttonTapped: (){
                          setState(() {
                            userQuestion="";
                            userAnswer="";
                          });
                         });
                    }
                    else if(index==1){
                      return ButtonS(color: Colors.red, textColor: Colors.black,
                       buttonText: buttons[index], buttonTapped: (){
                        setState(() {
                          userQuestion=userQuestion.substring(0,userQuestion.length-1);
                        });
                       });
                    }
                      else if (index == buttons.length - 1) {
                            return ButtonS(
                                color: Colors.deepPurple,
                                textColor: Colors.white,
                                buttonText: buttons[index],
                                buttonTapped: () {
                                  setState(() {
                                    equalPressed();
                                  });
                                });
                          }
                    else{
                      return ButtonS(color: isOperator(buttons[index])?Colors.orange:Colors.red[50],
                       textColor: isOperator(buttons[index])?Colors.black:Colors.black,
                       buttonText:buttons[index],
                        buttonTapped: (){
                          setState(() {
                            userQuestion+= buttons[index];

                          });
                        },
                       
                        );
                    }
                   }
              ))
            ],
          ))
        ],
      ),
    );
  }
  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '+' || x == '-' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}