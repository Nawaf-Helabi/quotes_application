// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quotes_application/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  final String title;
  final String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  List AllQuotes = [
    BestQuotes(title: 'بسم الله', author: 'nawaf'),
    BestQuotes(title: 'بسم الله', author: 'nawaf'),
    BestQuotes(title: 'بسم الله', author: 'nawaf'),
    BestQuotes(title: 'بسم الله', author: 'nawaf'),
    BestQuotes(title: 'بسم الله', author: 'nawaf'),
    BestQuotes(title: 'بسم الله', author: 'nawaf'),
  ];
  delete(BestQuotes remove) {
    setState(() {
      AllQuotes.remove(remove);
    });
  }
  final mycontroller1=TextEditingController();
  final mycontroller2=TextEditingController();
  AddQuote(){
    setState(() {
      AllQuotes.add(BestQuotes(title: mycontroller1.text, author: mycontroller2.text));

    });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          'Best Quotes',
          style: TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...AllQuotes.map((item) => Cards(
                  myTitle: item.title,
                  person: item.author,
                  delete: delete,
                  remove: item,
                )).toList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {showModalBottomSheet(context: context, builder: (BuildContext context){
          return Container(height: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextField(controller: mycontroller1,
              maxLength: 20,
              decoration: InputDecoration(hintText: 'Add new  Quote'),
             
            ),
            SizedBox(height: 20,), 
            TextField(controller: mycontroller2,
              maxLength: 20, decoration: InputDecoration(hintText: 'Add author'),
              ),
           
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              AddQuote();
              Navigator.pop(context);
            }, child: Text('ADD'))

          ],),);
        },isScrollControlled: true);},
        child: Icon(Icons.add),
      ),
    );
  }
}
