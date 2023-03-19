import 'package:flutter/material.dart';
class PassagePai extends StatefulWidget {
  
  const PassagePai({Key? key}) : super(key: key);

  @override
  State<PassagePai> createState() => _PassagePaiState();
}

class _PassagePaiState extends State<PassagePai> {

Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
 return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
     appBar: AppBar(
    title: const Text('Panier',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 00.5,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ,
    actions: <Widget>[
      
        IconButton(
      icon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {
         //Navigator.of(context).push(
                //  MaterialPageRoute(builder: (context)=> TestPage())
                
      },
        ),
     ]),
     body: SingleChildScrollView(
       child: Column(children: [ ]
       )
     )
 );
}

}