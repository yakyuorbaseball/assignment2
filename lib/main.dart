import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _textControllerA = TextEditingController();
  final _textControllerB = TextEditingController();

  double a = 0;
  double b = 0;
  double c = 0;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: Text(widget.title,style: TextStyle(fontSize: 25),),centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:
          Center(
            child:
            Column(
              children :[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children :[
                        Flexible(child:
                          SizedBox(
                            width: 80,
                            height: 170,
                            child: Container(
                              padding: const EdgeInsets.only(top: 40),
                              child: TextFormField(
                              controller: _textControllerA,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              ),
                              onChanged: (text){
                              setState(() {
                                a = double.tryParse(text) ?? 0;
                              });
                              },
                              ),
                            ),
                          ),
                        ),
                      Flexible(child:
                        SizedBox(
                          width: 80,
                          height: 170,
                          child: Container(
                            padding: const EdgeInsets.only(top: 40),
                            child: TextFormField(
                            controller: _textControllerB,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            ),
                              onChanged: (text){
                              setState(() {
                                b = double.tryParse(text) ?? 0;
                              });
                              },
                            ),
                          ),
                        ),
                      ),
                        Expanded(child:
                          Container(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Text('結果は：$c',maxLines: 1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ]
                    ),


                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 10,width: 25,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              c = a+ b;
                            });
                          },
                              child: Text('＋',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 10,width: 25,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              c = a - b;
                            });
                          },
                            child: Text('－',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 10,width: 25,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              c = a * b;
                            });
                          },
                            child: Text('×',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 10,width: 25,),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              c = a / b;
                            });
                          },
                            child: Text('÷',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
