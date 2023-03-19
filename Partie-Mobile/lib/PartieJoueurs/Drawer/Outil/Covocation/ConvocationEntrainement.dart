// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../Outil.dart';
class ConvocationEntrainementJou extends StatefulWidget {
  const ConvocationEntrainementJou({Key? key}) : super(key: key);

  @override
  State<ConvocationEntrainementJou> createState() => _ConvocationEntrainementState();
}

class _ConvocationEntrainementState extends State<ConvocationEntrainementJou> {
  @override
Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
    title: const Text(' Convocation Entrainement ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView( 
      child: Column(children: [
        const SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
          Container(
            child:
             Padding(
               padding: const EdgeInsets.only(left:25.0),
               child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 15,),
                const Text("Exerices D'échauffement",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 213, 43, 30)),),
                const SizedBox(height: 7,),
                Row(children: [
                  const Text("Durée",style: const TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 138, 135, 135)),),
                  const SizedBox(width: 10,),
                  const Text("30 min",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 44, 13, 117)),),
                ],)
                
            ]),
             ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11)
            ),
            height:screenHeight/11.6 ,
            width: screenWidth/1.1,
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
          Container( child:
             Padding(
               padding: const EdgeInsets.only(left:25.0),
               child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 15,),
                const Text("Bloc Principal",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 213, 43, 30)),),
                const SizedBox(height: 7,),
                Row(children: const [
                  Text("Durée",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 138, 135, 135)),),
                  SizedBox(width: 10,),
                  Text("45 min",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 44, 13, 117)),),
                ],)
                
            ]),
             ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11)
            ),
            height:screenHeight/11.6 ,
            width: screenWidth/1.1,
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
          Container(
             child:
             Padding(
               padding: const EdgeInsets.only(left:25.0),
               child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 15,),
                const Text("Situation de jeu",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 213, 43, 30)),),
                const SizedBox(height: 7,),
                Row(children: [
                  const Text("Durée",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 138, 135, 135)),),
                  const SizedBox(width: 10,),
                  const Text("30 min",style: const TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 44, 13, 117)),),
                ],)
                
            ]),
             ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11)
            ),
            height:screenHeight/11.6 ,
            width: screenWidth/1.1,
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
          Container(
             child:
             Padding(
               padding: const EdgeInsets.only(left:25.0),
               child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 15,),
                const Text("Phase de récupération",style: const TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 213, 43, 30)),),
                const SizedBox(height: 7,),
                Row(children: [
                  const Text("Durée",style: const TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 138, 135, 135)),),
                  const SizedBox(width: 10,),
                  const Text("15 min",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 44, 13, 117)),),
                ],)
                
            ]),
             ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11)
            ),
            height:screenHeight/11.6 ,
            width: screenWidth/1.1,
            
          ),
        ),
        Container(height:screenHeight/4.6 ,
    width:screenWidth/1.1 ,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      
    color: Colors.white,),
    child: Column(children: [
      const Padding(
        padding: EdgeInsets.only(left:200.0),
        child: Text("Ven 10 Déc 2021 / 17:30 pm",style: TextStyle(fontFamily: 'Poppins',fontSize:9 , fontWeight: FontWeight.w400,color: Color.fromARGB(255, 167, 165, 165)) ,),
      ),
      Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Padding(
          padding: const EdgeInsets.only(right:60.0),
          child: Row(children: [
            Image.asset("assets/profill.png"),
            const SizedBox(width: 10,),
            const Text('Nom Prenom',style: const TextStyle(fontFamily: 'Poppins',fontSize:12 , fontWeight: FontWeight.w500,color: Color.fromARGB(255, 0, 0, 0)) ,),

          ],),
        ),
        Row(children: [
          const Icon(Icons.star,color: Colors.yellow,),
          const Icon(Icons.star,color: Colors.yellow),
          const Icon(Icons.star),
          const Icon(Icons.star),
          const Icon(Icons.star),
        ],)
      ],),
      const SizedBox(height: 10,),
      Container(
        height: screenHeight/7.8,
        width: screenWidth/1.2,
        color: const Color.fromARGB(255, 255, 244, 222),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Image.asset("assets/comm.png"),
            const SizedBox(width: 7,),
            const Text("Bien!!",style: TextStyle(fontFamily: 'Poppins',fontSize:10 , fontWeight: FontWeight.w400,color: Color.fromARGB(255, 0, 0, 0)) ,),
          ],),
        ),
      ),
    ]),
    ),
    const SizedBox(height: 20,),
      Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
              
             Container(child:
                   
               
                Image.asset("assets/image.png")),
              const SizedBox(width: 25,),
             Image.asset("assets/image.png"),
             const SizedBox(height: 25,),

           ],),
           const SizedBox(height: 25),
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [ 
            Image.asset("assets/image.png"),
            const SizedBox(width: 25,),
            Image.asset("assets/image.png"),],)
          
      ])
      ),
       bottomNavigationBar: Container(
            
            child: BottomNavigationBar(
     
      
      unselectedItemColor: const Color.fromARGB(255, 14, 21, 110),
      
      selectedLabelStyle: const TextStyle(color:  Color.fromARGB(255, 14, 21, 110),decorationColor: Color.fromARGB(255, 14, 21, 110),fontFamily: 'Poppins',fontSize: 11,fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(color:  Color.fromARGB(255, 14, 21, 110),decorationColor: Color.fromARGB(255, 14, 21, 110),fontFamily: 'Poppins',fontSize: 11,fontWeight: FontWeight.w500),
      backgroundColor: const Color.fromARGB(255, 14, 21, 110),
      fixedColor: const Color.fromARGB(255, 14, 21, 110),
      showUnselectedLabels:true,  
      items:  <BottomNavigationBarItem> [
        
    
    BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12,),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          // Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context)=> const Home()));
                  
  },
  icon:const Icon(Icons.home_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Acceuil"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
     BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          // Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context)=> const Calendrier()));
                  
        },
        icon:const Icon(Icons.calendar_today, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Calendrier"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
  BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          // Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context)=> const ListMsg()));
                  },
        icon:const Icon(Icons.message_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Message"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
  BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
// Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context)=> const Outil()));
                  
        },
        icon:const Icon(Icons.shopping_bag_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Mes Outils"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),    ]
    ),
          ),
      
      
    
    );
}
}