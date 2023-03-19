// ignore_for_file: sized_box_for_whitespace

import 'package:app_parent/Boutique/DetailProduit.dart';
import 'package:app_parent/Boutique/boutique.dart';
import 'package:app_parent/Boutique/recherche.dart';
import 'package:app_parent/PartieJoueurs/boutique/DetailProduitJou.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/boutique/recherche.dart';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
// ignore: camel_case_types
class filtre2jou extends StatefulWidget {
  const filtre2jou({Key? key}) : super(key: key);

  @override
  _filtre2State createState() => _filtre2State();
}
// ignore: camel_case_types
class _filtre2State extends State<filtre2jou> {
   // ignore: non_constant_identifier_names
   Widget Article() {
    
    

    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return 
    Expanded(
      child: Container(
        width: 500,
        height:screenHeight/4.7 ,
        child: ListView(
          shrinkWrap: true,
                            
           primary: false,
          addSemanticIndexes: true,
          scrollDirection: Axis.horizontal,
          
            children :[
          
           Container(
                  height:screenHeight/4.7 ,
                  width: screenWidth/1.10,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset("assets/chos.png")),
                          
                              
                               Expanded(
                                child: Column( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                  const SizedBox(height: 17),
                                  const Padding(
                                  padding: EdgeInsets.only(left :15.0,right: 90),
                                  child:  Text("Nike Air Zoom Pegasus 38- Homme - Gris",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 30, 32, 34)),),
                                  ),
                                  const SizedBox(height: 13,),
                              
                                
                                  
                                      const Padding(
                                        padding: EdgeInsets.only(left:15.0),
                                        child:  Text("ID 1234568 /",style:TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 124, 124, 124)),textAlign: TextAlign.start),
                                      ),
                                      
                                   
                                    
                                    
                                  
                                  const SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:15.0),
                                    child: Row(children: const [
                                    Icon(Icons.star,color: Colors.yellow,size: 14,),
                                    Icon(Icons.star,color: Colors.yellow,size: 14),
                                    Icon(Icons.star,color: Colors.yellow,size: 14),
                                    Icon(Icons.star,color: Colors.yellow,size: 14),
                                    Icon(Icons.star,color: Colors.yellow,size: 14),
                                ],),
                                  ),
                                  const SizedBox(height: 7),
                                  const Padding(
                                    padding: EdgeInsets.only(left:18.0),
                                    child: Text("€ 141.00",style:TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w700,color: const Color.fromARGB(255, 14, 21, 110)) ,),
                                  ),
        
                                  ],)
                                
                              ),
        
                        ]
                        ),
                        const SizedBox(),
                        
                      Container(
                        height: 1,
                        width:screenWidth/1.10, 
                        decoration: const BoxDecoration( color: const Color.fromARGB(255, 214, 214, 214),),
                       
                      ),
                      Container(
                        height: screenWidth/10,
                        width:screenWidth/1.10, 
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
        
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                  height: 32,
                                  width: 30,
                                  decoration: BoxDecoration(
                                  
                                  color: const Color.fromARGB(255, 14, 21, 110),
                                  borderRadius: BorderRadius.circular(7)
                                )),
                              ),
                               const Padding(
                                 padding: EdgeInsets.only(left:9.5),
                                 child:  LikeButton(size: 25,
                                 )
                               ),
                            ],),
                          )
                         ,
                         const SizedBox(width: 5,),
                          IconButton(onPressed: (){}, icon:const Icon(Icons.share_outlined,color: Colors.red,)),
                            Padding(
                              padding: const EdgeInsets.only(left:120.0),
                              // ignore: sized_box_for_whitespace
                              child: Container(
                                height: 29,
                                child: ElevatedButton.icon(
                                        icon: const Icon(Icons.shopping_bag,color: Colors.white,size: 9,),
                                          label: const Center(child: Text("Ajouter au panier",style: TextStyle(fontSize: 9,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ,color:Color.fromARGB(255, 255, 255, 255),),),),
                                          onPressed: (){

                  //                               Navigator.of(context).push(
                  // MaterialPageRoute(builder: (context)=>  DetailProduitjou()));

                                          },
                                          style:
                          ElevatedButton.styleFrom(
                          
                          fixedSize: const Size(130, 18),
                          primary: const Color.fromARGB(255, 213, 43, 30),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                           ) 
                                           )
                                        
                                         ),
                              ),
                            ),
                        ],),
                      ),
                     ],
                  ),
          
          ),
          Container(
            height: 10,
            width: 70,
            color: const Color.fromARGB(255, 244, 247, 250),
            child: Center(child: Image.asset("assets/poubelle.png")),
          )
            ]),
      ),
    );
  }
 @override
  Widget build(BuildContext context) {
    
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
         backgroundColor: const Color.fromARGB(255, 244, 247, 250),
     appBar: AppBar(
    title: const Text('Article Apres recherche',style:  TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 00,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ,
automaticallyImplyLeading: false,
    leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const boutiquejou()));
        },
         icon:const Icon(Icons.arrow_back,size: 25,)),
    actions: <Widget>[
      Row(children: [
        IconButton(
      icon: const Icon(
        Icons.search,
        color: Colors.white,

      ),
      
      onPressed: () {
         Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
      },
        ),
         IconButton(
      icon: const Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
        ),
        ],
      ),
      ],
    ),
        body: SingleChildScrollView(
        child: Column(children: [
          Row(children: [
            InkWell(
        onTap: (){},
        child:
            Container(
              width: screenWidth/4.6,
              height: screenHeight/16.9,
              
               child: Padding(
                padding: const EdgeInsets.only(left:0.0),
                child: Image.asset("assets/filtre1.png"),
              ),
              decoration: const BoxDecoration(
              color:  Color.fromARGB(255, 14, 21, 110),
                          border:  Border(
               
                right: BorderSide( 
                  color:  Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                 top: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
            ))
             ) ),
            Container(
              width: screenWidth/2.5,
              height: screenHeight/16.9,
              child: Padding(
                padding: const EdgeInsets.only(left:35.0),
                child: Row(
                  children: [

                    Image.asset("assets/filtre2.png"),
                    const SizedBox(width: 7,),
                    const Text("Filtres",style:  TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)
                  ],
                ),
              ),
              decoration: const BoxDecoration(
              color:  Color.fromARGB(255, 14, 21, 110),
                          border:  Border(
                left:  BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                right: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                 top:  BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
            ),
            ),
            ),

                  InkWell(
                         onTap: (){
                          showDialog(
                          context: context,
                          builder: (context){
                          return  AlertDialog(
                     
                            title:Padding(
                              padding: const EdgeInsets.only(bottom:0.0),
                              child: Container(
                                
                                height: 40,
                                width: 100,
                                color: const Color.fromARGB(255, 14, 21, 110),
                                child: const Center(child: Text("Filtre Par",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,))),
                            ) ,
                 content: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                 TextButton(onPressed: (){
                    Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                 }, child: const Text("Popularité",style:  TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                 TextButton(onPressed: (){
                    Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                 }, child: const Text("Nouveauté",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                 TextButton(onPressed: (){
                    Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                 }, child: const Text("Prix le plus bas",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                 TextButton(onPressed: (){
                    Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                 }, child: const Text("Prix le plus haut",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                 ],)
                 );
                
        });

        },
         child:

            Container(
              width: screenWidth/2.615,
              height: screenHeight/16.9,
               child: Padding(
                padding: const EdgeInsets.only(left:35.0),
                child: Row(
                  children: [

                    Image.asset("assets/filtre3.png"),
                    const SizedBox(width: 7,),
                    const Text("Trier par ",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)
                  ],
                ),
              ),
              decoration: const BoxDecoration(
              color:  Color.fromARGB(255, 14, 21, 110),
                          border:  Border(
                left: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                
                 top: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
            )
            )
            ),
           ) 
           ],
            ),
            const SizedBox(height: 22,),
            // ignore: sized_box_for_whitespace
            Container(
               height:screenHeight/1.38 ,
               width: screenWidth/1.10,
               child: Expanded(
                 child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
  
      height: 17,
  
    ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 3,
                  addSemanticIndexes: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                  return Article();
                  }
                   ),
               ),
             ),
            ]
            )
            )
            );
        }
        }