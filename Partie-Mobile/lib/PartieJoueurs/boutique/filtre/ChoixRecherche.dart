
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/boutique/filtre/filtre2.dart';
import 'package:app_parent/PartieJoueurs/boutique/recherche.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class choixjou extends StatefulWidget {
  @override
  _choixState createState() => _choixState();
}
class _choixState extends State<choixjou> {
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
                         child: LikeButton(
                           
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
                    const Padding(padding: const EdgeInsets.all(10)),
                    const Padding(
                      padding: EdgeInsets.only(left:10.0),
                      child: const Text("Nike Air Zoom Pegasus 38 - Homme - Gris", style:TextStyle(fontSize: 11,color: Color.fromARGB(255, 105, 105, 105),fontFamily:'Poppins',fontWeight:FontWeight.w400,  ),textAlign: TextAlign.start, ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right:75),
                      child: Text("ID 12345678/",style: const TextStyle(fontSize: 10,color: Color.fromARGB(255, 119, 131, 143),fontFamily:'Poppins',fontWeight:FontWeight.w400),textAlign: TextAlign.start,),
                    ),
                    const SizedBox(height: 7,),
                    Padding(
                       padding: const EdgeInsets.only(left:10),
                      child: Row(children: [
                        const Icon(Icons.star,color: Colors.yellow,size: 14,),
                        const Icon(Icons.star,color: Colors.yellow,size: 14),
                        const Icon(Icons.star,color: Colors.yellow,size: 14),
                        const Icon(Icons.star,color: Colors.yellow,size: 14),
                        const Icon(Icons.star,color: Colors.yellow,size: 14),
                      ],)
                    ),
                   const SizedBox(height: 7,),
                    const Padding(
                      padding: EdgeInsets.only(right:80),
                      child: Text("120.00D",style:TextStyle(fontSize:14, color: const Color.fromARGB(255, 14, 21, 110),fontFamily:'Poppins',fontWeight:FontWeight.w500 )),
                    ),
                   // SizedBox(height: 10,),
                    ElevatedButton.icon(onPressed:() {},
                          icon: const Icon(Icons.shop ,size: 9),
                          label: const Text("Ajouter au panier",style:TextStyle(fontSize: 9,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ) ,),
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
    title: const Text('Article Apres recherche',style: const TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
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
        onTap: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> filtre2jou()));

        },
        child:
            Container(
              width: screenWidth/4.6,
              height: screenHeight/16.9,
              
               child: Padding(
                padding: const EdgeInsets.only(left:0.0),
                child: Image.asset("assets/filtre1.png"),
              ),
              decoration: const BoxDecoration(
              color: Color.fromARGB(255, 14, 21, 110),
                          border: Border(
               
                right: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
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
                    const Text("Filtres",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)
                  ],
                ),
              ),
              decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 14, 21, 110),
                          border: const Border(
                left: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                right: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                 top: BorderSide( 
                  color: Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
            ))),

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
                       child: const Center(child: const Text("Filtre Par",style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center,))),
                   ) ,
                 content: Container(
                 
                   child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                   TextButton(onPressed: (){
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                   }, child: const Text("Popularité",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                   TextButton(onPressed: (){
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                   }, child: const Text("Nouveauté",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                   TextButton(onPressed: (){
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                   }, child: const Text("Prix le plus bas",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                   TextButton(onPressed: (){
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> TestPagejou()));
                   }, child: const Text("Prix le plus haut",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),textAlign: TextAlign.center,)),
                 ],))
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
                    const Text("Trier par ",style: const TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)
                  ],
                ),
              ),
              decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 14, 21, 110),
                          border: Border(
                left: const BorderSide( 
                  color: const Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
                
                 top: const BorderSide( 
                  color: const Color.fromARGB(255, 120, 129, 248),
                  width: 1.0,
                ),
            ))
            ),
           ) ],),
       Padding(
      padding: const EdgeInsets.all(17.0),
      child: Container(
          height: screenHeight/1.2,
          width: screenWidth,
        child: GridView.builder(
                
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  childAspectRatio: 1.8 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30),
                  
              itemCount: 7,
              itemBuilder: (BuildContext ctx, index) {
                return Articlee();
      })),
    ),
    const SizedBox(height: 30,)
       ]

       )
       )
       );
  }
}