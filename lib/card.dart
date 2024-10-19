// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotes_application/main.dart';

class Cards extends StatelessWidget {
     final String ?myTitle;
     final String ?person;
     final Function delete;
     final BestQuotes remove;
  Cards({required this.myTitle ,required this.person,required this.delete,required this.remove});

  @override
  Widget build(BuildContext context) {
    return Card(shadowColor: Colors.blue,
          elevation: 1,
            margin: EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            color: Colors.blue[300],
            child: Container(padding: EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Text('$myTitle',style: TextStyle(color: Colors.white,fontSize: 33),textDirection: TextDirection.rtl,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [IconButton(onPressed: (){delete(remove);}, icon: Icon(Icons.delete,color: Colors.black,),iconSize: 27,),
                     Text('$person',style: TextStyle(color: Colors.white,fontSize: 19),textDirection: TextDirection.rtl,),
                     
                   ],
                 )],
              ),
            ),
          );
  }
}