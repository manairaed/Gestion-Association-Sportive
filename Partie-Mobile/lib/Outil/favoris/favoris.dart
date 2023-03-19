// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class panier extends StatefulWidget {
  const panier({Key? key}) : super(key: key);

  @override
  State<panier> createState() => _panierState();
}
class _panierState extends State<panier> {


  Widget Articlee() { 
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
     return Container(
               height: screenHeight/2.9 ,
               width: screenWidth/2.53,
               decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
                        ),
             child: Column(children: [
               
                Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset("assets/chaussur.png"),
                      ),

                      Column(
                         children: [
                           const Align(
                         alignment: Alignment.topRight,
                         child:  LikeButton(
                           
                          size: 20,
                           
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end, 
                          
                           
                        ),
                       ),
                          Align(
                         alignment: Alignment.topRight,
                       
                       child :IconButton(
                         onPressed:() {},

                         icon: const Icon(Icons.share,color: Colors.red),
                         alignment: Alignment.topLeft,
                         
                         ),
                       ),
                         ],
                       ),
                     ],
                   ),
                   //SizedBox(height:15 ),
                    const Padding(padding:  EdgeInsets.all(10)),
                    const Padding(
                      padding: EdgeInsets.only(left:10.0),
                      child: Text("Nike Air Zoom Pegasus 38 - Homme - Gris", style: TextStyle(fontSize: 11,color: Color.fromARGB(255, 105, 105, 105),fontFamily:'Poppins',fontWeight:FontWeight.w400,  ),textAlign: TextAlign.start, ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right:75),
                      child: Text("ID 12345678/",style:  TextStyle(fontSize: 10,color: Color.fromARGB(255, 119, 131, 143),fontFamily:'Poppins',fontWeight:FontWeight.w400),textAlign: TextAlign.start,),
                    ),
                    const SizedBox(height: 7,),
                    Padding(
                       padding: const EdgeInsets.only(left:10),
                      child: Row(children: const [
                        Icon(Icons.star,color: Colors.yellow,size: 14,),
                        Icon(Icons.star,color: Colors.yellow,size: 14),
                        Icon(Icons.star,color: Colors.yellow,size: 14),
                        Icon(Icons.star,color: Colors.yellow,size: 14),
                        Icon(Icons.star,color: Colors.yellow,size: 14),
                      ],)
                    ),
                   const SizedBox(height: 7,),
                    const Padding(
                      padding: EdgeInsets.only(right:80),
                      child:  Text("120.00D",style: TextStyle(fontSize:14, color: Color.fromARGB(255, 14, 21, 110),fontFamily:'Poppins',fontWeight:FontWeight.w500 )),
                    ),
                   // SizedBox(height: 10,),
                    ElevatedButton.icon(onPressed:() {},
                          icon: const Icon(Icons.shop ,size: 9),
                          label: const Text("Ajouter au panier",style: TextStyle(fontSize: 9,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ) ,),
                          style:
                          
                          ElevatedButton.styleFrom(
                            
                          fixedSize: const Size(127, 29),
                          primary: const Color.fromARGB(255, 213, 43, 30),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                           )  ,
                          ),
                    ),
             ]),
     
              );
  }
@override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
    title: const Text('Mes favoris',style:  TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:
    Padding(
      padding: const EdgeInsets.all(17.0),
      child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190,
                childAspectRatio: 1.8 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 6,
            itemBuilder: (BuildContext ctx, index) {
              return Articlee();
      }),
    ));
}
}