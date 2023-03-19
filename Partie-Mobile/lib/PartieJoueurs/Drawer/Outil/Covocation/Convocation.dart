
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Covocation/ConvocationEntrainement.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Covocation/ConvocationMatch.dart';
import 'package:flutter/material.dart';


import '../Outil.dart';
class ConvocationJou extends StatefulWidget {
  const ConvocationJou({Key? key}) : super(key: key);

  @override
  State<ConvocationJou> createState() => _ConvocationState();
}

class _ConvocationState extends State<ConvocationJou> {
  Widget Convoca () {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(children: [
            Image.asset("assets/clock.png",color: Colors.grey,),
            const SizedBox(width: 5,),
            const Text("Date/Time",style:  TextStyle(fontFamily: 'Poppins',fontSize: 11,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 190, 190, 190)),)
          ],),
        ),
         GestureDetector(
        onTap: (){
          Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ConvocationEntrainementJou())
                );
        },
                   
               child:
         Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Container(
                    child: Image.asset("assets/ballon.png",), 
                    
                    margin: const EdgeInsets.all(12),
                    height: screenHeight/16.8 ,
                    width: screenWidth/7.04,
                    decoration:BoxDecoration (
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 236, 238, 255)
                  )
                  ),
                  
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:  const [
                       Text("Entrainement", style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w500) ,),
                     SizedBox(height: 7),

                       Text("De 8:30 - jusqu'a 11:35 am ",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 153, 153, 160)),),
                     SizedBox(height: 7),
                       Text("Coach fréderic",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 153, 153, 160)),),
                       
                       
                       
                       ],
                   ),
                 )
                ]
                ),
                Container(
                  height: 1,
                  width: screenWidth,
                  color: const Color.fromARGB(255, 212, 209, 209),

                ),
                const SizedBox(height: 10,),
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left :10.0),
                    child: Row(children: [
                      Image.asset("assets/comments.png",color: const Color.fromARGB(255, 80, 80, 80),height: 24,width: 24,),
                      const SizedBox(width: 7,),
                      const Text("dataaaaaaaaaaaaaaaaaaaaa")
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:60),
                    child: Row(children: const [
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                    ],),
                  )
                ],)
              ],
            ),
            
             height: screenHeight/5.9 ,
          width: screenWidth/1.1,
          decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
          )),

         Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(children: [
            Image.asset("assets/clock.png",color: Colors.grey,),
            const SizedBox(width: 5,),
            const Text("Date/Time",style:  TextStyle(fontFamily: 'Poppins',fontSize: 11,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 190, 190, 190)),)
          ],),
        ),

        GestureDetector(
        onTap: (){
          Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ConvocationMatchJou())
                );
        },
                   
               child:
         Container(
             height:screenHeight/23.6 ,
              width: screenWidth/1.10,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
              topRight :Radius.circular(10),
               topLeft: Radius.circular(10),
            ),
            color: Colors.white),
            
	    child:
      
            const Center(child: Text("Le chamiponnat 3x3 FFBB 2020/2021", style:TextStyle(color:Color.fromARGB(255, 14, 21, 110) ,fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 13), textAlign: TextAlign.center,)),

            )),
            const SizedBox(height: 2),
            
            GestureDetector(
        onTap: (){
          Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ConvocationMatchJou())
                );
        },
                   
               child:Container(
              height:screenHeight/4 ,
              width: screenWidth/1.10,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
               bottomLeft:  Radius.circular(5),
              bottomRight:  Radius.circular(5),
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
            
                   Row(
                     //mainAxisAlignment: MainAxisAlignment.end,
                     //crossAxisAlignment:  CrossAxisAlignment.end ,
                     children: [
                      
                     ElevatedButton(
                     child: const Text('Phase 1:Série de comité'),
                     onPressed: (){ },
                    
                     style:ElevatedButton.styleFrom(
                     primary:const Color.fromARGB(255, 14, 21, 110) ,
                     fixedSize: const Size(186, 35),
              ),
                   ),
                    ElevatedButton(
                    child: const Text('1/4 Final'),
                    onPressed: (){},
                    style:ElevatedButton.styleFrom(
                       fixedSize: const Size(186, 35),
                    primary:const Color.fromARGB(255, 119,129, 248) ,
              ),
                   )],),
                   Container(height: 1,width: screenWidth,color: Colors.grey,),
                   Row(children: [
                     Padding(
                    padding: const EdgeInsets.only(left :10.0),
                    child: Row(children: [
                      Image.asset("assets/comments.png",color: const Color.fromARGB(255, 27, 25, 153),height: 24,width: 24,),
                      const SizedBox(width: 7,),
                      const Text("dataaaaaaaaaaaaaaaaaaaaa",style:  TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 0, 53, 97)),)
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:60),
                    child: Row(children: const [
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                      Icon(Icons.star,color: Color.fromARGB(255, 255, 186, 59),size: 12),
                    ],),
                  )
                   ],)
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
            )
            ), 
            
    ]
    
    );
    
    }
// This widget is the root of your application.
    @override
Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
    title: const Text(' Convocation &  Présence ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     actions: <Widget>[

    GestureDetector(
        onTap: (){
          
          
               showDialog(
                  context: context,
                   builder: (context){
                   return  AlertDialog(
                   title:Container(
                     height: 40,
                     color: const Color.fromARGB(255, 14, 21, 110),
                     child: const Center(child:  Text("Filtre Par",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,))) ,
                 content: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                   TextButton(onPressed: (){
                       Navigator.of(context).push(
                   MaterialPageRoute(builder: (context)=> const ConvocationJou()));
                   }, child: const Text("Mois",style:  TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                   TextButton(onPressed: (){
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ConvocationEntrainementJou()));
                   }, child: const Text("Entrainement",style:  TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                   TextButton(onPressed: (){
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ConvocationMatchJou()));
                   }, child: const Text("Match",style:  TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color:  Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,))

                 ],)
                 );
                
        });},
                   
               child: Image.asset("assets/filtre.png"),
    )],
    elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView( 
    child:ListView.separated(
  
               separatorBuilder: (context, index) => const SizedBox(
  
      height: 20,
  
    ),
  
              scrollDirection: Axis.vertical,
  
              addSemanticIndexes: true,
  
              //itemExtent: 500,
  
              itemCount: 3,
  
              primary: false,
  
              shrinkWrap: true,
  
              itemBuilder: (context,index){
  
                return Convoca();
  
              }
  
            ),
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