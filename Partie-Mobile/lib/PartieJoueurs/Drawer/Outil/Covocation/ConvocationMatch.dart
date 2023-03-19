import 'package:flutter/material.dart';


import '../Outil.dart';
class ConvocationMatchJou extends StatefulWidget {
  const ConvocationMatchJou({Key? key}) : super(key: key);

  @override
  State<ConvocationMatchJou> createState() => _ConvocationMatchState();
}

class _ConvocationMatchState extends State<ConvocationMatchJou> {
  @override
Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
    title: const Text(' Convocation Match ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView( 
      child: Column(children: [
        Container(
          child: const Center(child: Text("Le championnat 3x3 FFBB 2020/2021",style: TextStyle(fontSize: 13 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.white),)),
          height:screenHeight/13.5 ,
          width:screenWidth ,
          color: Colors.red,
        ),
const SizedBox(height: 10,),
        Container(
              height:screenHeight/8.2 ,
              width: screenWidth/1.10,
              decoration: const BoxDecoration(
              borderRadius:  BorderRadius.only(
               bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
           ),
            color: Colors.white),
            child:Column(children :[
             Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Image.asset("assets/team0.png",alignment:Alignment.centerLeft),
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [

              Text("Mar 14 Déc 17:00 pm",style: TextStyle(color: Color.fromARGB(255,119, 131, 143),fontSize: 12,fontWeight:FontWeight.w600 )),
              Text("63 - 61",style: TextStyle(color: Color.fromARGB(255, 213, 43,30),fontSize: 17,fontWeight:FontWeight.w700 ))
                ]
              ),
               Padding(
                 padding: const EdgeInsets.only(right:15.0),
                 child: Image.asset("assets/team1.png"),
               ),

            ]
            ),

      ]),



    ),
    const SizedBox(height: 20,),
    Container(
      height: screenHeight/4.4,
      width:  screenWidth/1.10,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset("assets/joueur.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 24,),
                 Text("Prénom Nom " ,style: TextStyle(fontFamily: 'Poppins',fontSize:14 , fontWeight: FontWeight.w600,color: Color.fromARGB(255, 12, 71, 119)),),
              
              Text("Num 13 / Meneur-Arrière",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 12, 71, 119)),)
              ],),
            )

          ]),
          Container(
            width: screenWidth/1.1,
            height: screenHeight/11.4,
            color: const Color.fromARGB(255, 120, 129, 248),
            child: Row(children: [
              Row(children: [
                Image.asset("assets/baskett.png"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(children: [
                    const Text("Points",style: const TextStyle(fontFamily: 'Poppins',fontSize:11 , fontWeight: FontWeight.w400,color: Color.fromARGB(255, 255, 255, 255)) ,),
                    const Text("16.6", style:const TextStyle(fontFamily: 'Poppins',fontSize:12 , fontWeight: FontWeight.w500,color: Color.fromARGB(255, 255, 255, 255))
                  )],),
                )
              ],),
               Row(children: [
                Image.asset("assets/goall.png"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(children: [
                    const Text("Points",style: TextStyle(fontFamily: 'Poppins',fontSize:11 , fontWeight: FontWeight.w400,color: Color.fromARGB(255, 255, 255, 255)) ,),
                    const Text("16.6", style:const TextStyle(fontFamily: 'Poppins',fontSize:12 , fontWeight: FontWeight.w500,color: Color.fromARGB(255, 255, 255, 255))
                  )],),
                )
              ],),
               Row(children: [
                Image.asset("assets/combat.png"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(children: [
                    const Text("Points",style: const TextStyle(fontFamily: 'Poppins',fontSize:11 , fontWeight: FontWeight.w400,color: Color.fromARGB(255, 255, 255, 255)) ,),
                    const Text("16.6", style:TextStyle(fontFamily: 'Poppins',fontSize:12 , fontWeight: FontWeight.w500,color: Color.fromARGB(255, 255, 255, 255))
                  )],),
                )
              ],),
            ]),
          )
        ],
      ),
      
    ),
    const SizedBox(height: 20,),
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
            const Text('Nom Prenom',style: const TextStyle(fontFamily: 'Poppins',fontSize:12 , fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 0, 0, 0)) ,),

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
            const Text("Bien!!",style: const TextStyle(fontFamily: 'Poppins',fontSize:10 , fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 0, 0, 0)) ,),
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
                  // MaterialPageRoute(builder: (context)=> const Outil()));
                  
        },
        icon:const Icon(Icons.shopping_bag_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Mes Outils"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),    ]
    ),
          ),
    );
    
}

}