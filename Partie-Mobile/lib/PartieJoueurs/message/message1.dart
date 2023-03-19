// ignore_for_file: non_constant_identifier_names, unused_local_variable, duplicate_ignore
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Outil.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/PartieJoueurs/message/message2.dart';
import 'package:flutter/material.dart';
class ListMsg1jou extends StatefulWidget {
  const ListMsg1jou({Key? key}) : super(key: key);

  @override
  _ListMsgState createState() => _ListMsgState();
}
class _ListMsgState extends State<ListMsg1jou> {
  Widget Chat () {
     
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Column(children: <Widget> [
      InkWell(
    
    onTap: () { 
         Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Message2jou()));
    },
child:
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top:22.0),
            child: Container(
              height: screenHeight/10.27,
              width: screenWidth/1.08,
              color: const Color.fromARGB(255, 246, 246, 246),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                      Padding(
                        padding: EdgeInsets.only(top:5.0),
                        child: Text("Parsley Montana",style: TextStyle(fontSize: 15 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:3.0),
                        child: Text("10.56",style: TextStyle(fontSize: 11 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 119, 131, 143)),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:4.0),
                        child: Text("https://mail.interface-crm...",style: TextStyle(fontSize: 11 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 119, 131, 143)),),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0,bottom: 10),
                    child: Stack(children:[ Image.asset('assets/avatar.png',height: 80,width: 65,),
                    Padding(
                      padding: const EdgeInsets.only(top:45.0),
                      child: Container(height:20,
                      width: 20,
                      decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 255, 16, 16),
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(child:  Text("2",style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 255, 255, 255)),)),
                      
                      ),
                    ),
                    ]),
                  )
                ],
              ),

            ),
          ),
        )),
        const SizedBox(height:5),
        Container(
          height: 1,
          width: screenWidth,
          color: const Color.fromARGB(255, 212, 212, 212)
        )
      ] 
    );

  }
 @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    
    final screenHeight=MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
         backgroundColor: const Color.fromARGB(255, 246, 246, 246),
     appBar: AppBar(
    title: const Text('Messageries',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 00,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ,
    automaticallyImplyLeading: false,
    leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const HomeJoueur()));
        },
         icon:const Icon(Icons.arrow_back,size: 25,)
         ),
         ), 
         body:SingleChildScrollView(
      child: ListView.builder(
        
         scrollDirection: Axis.vertical,
                  addSemanticIndexes: true,
                  itemCount: 10,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Chat();
                  }
      )
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
         Navigator.of(context).push(
               MaterialPageRoute(builder: (context)=> const HomeJoueur()));
                  
  },
  icon:const Icon(Icons.home_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Acceuil"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
     BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
        Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>  CalendarJou()));
                  
        },
        icon:const Icon(Icons.calendar_today, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Calendrier"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
  BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> const ListMsg1jou()));
                  },
        icon:const Icon(Icons.message_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Message"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
  BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const OutilJou()));
                  
        },
        icon:const Icon(Icons.shopping_bag_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),
    label:("Mes Outils"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),    ]
    ),
          ),
      
      );
}
}