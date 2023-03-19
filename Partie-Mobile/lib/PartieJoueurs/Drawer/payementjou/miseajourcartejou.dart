import 'package:app_parent/Coach/payementco/infocartecoach.dart';
import 'package:app_parent/Coach/payementco/payCoach.dart';
import 'package:app_parent/HomeScreen/InfoCarte.dart';
import 'package:app_parent/PartieJoueurs/boutique/panier/Profil/panier/InfoCarteJou.dart';
import 'package:app_parent/PartieJoueurs/boutique/panier/Profil/panier/LicencePayementJou.dart';
import 'package:flutter/material.dart';


class ModepaiJou extends StatefulWidget {
  const ModepaiJou({Key? key}) : super(key: key);

  @override
  State<ModepaiJou> createState() => _ModepaiState();
}

class _ModepaiState extends State<ModepaiJou> {
   @override
   
   Widget build(BuildContext context) {
     Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromARGB(255, 36, 145, 15);
    }
      final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
      automaticallyImplyLeading: false,
        leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const PayementJou()));
        },
icon:const Icon(Icons.arrow_back_outlined,size: 25,)),  
    title: const Text('Mise à jour mode de paeiment ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView(

        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:28.0, top:28),
              child: Text(" Par Carte Crédit ",style: TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                
               padding: const EdgeInsets.all(8),
                 child: Stack(
                   
                   alignment: Alignment.centerRight,
                   children: [
                                    
                                    InkWell(onTap: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const InfoCarteJou()));
                                    },
                                   child: Image.asset("assets/OB.png")),

                    Padding(
                      padding: const EdgeInsets.only(right:0),
                      child: Padding(
                        padding: const EdgeInsets.only(left:3),
                        
                        
                      ),)])),
                      
                Container(
               padding: const EdgeInsets.all(8),
                 child: Stack(
                   
                   alignment: Alignment.centerRight,
                   children: [
 InkWell(onTap: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const InfoCarteJou()));
                                    },
                                   child:Image.asset("assets/visaa.png"),
                )])),
               
            ],),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                
               padding: const EdgeInsets.all(8),
                 child: Stack(
                   
                   alignment: Alignment.centerRight,
                   children: [
                                     InkWell(onTap: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const InfoCarteJou()));
                                    },
                                   child:Image.asset("assets/mastercard.png"),

              )])),
                      
                Container(
               padding: const EdgeInsets.all(8),
                 child: Stack(
                   
                   alignment: Alignment.centerRight,
                   children: [
                      InkWell(onTap: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const InfoCarteJou()));
                                    },
                                   child:Image.asset("assets/American.png")),
                    Positioned(
                      bottom:50 ,
                      top: 0,
                      
                      child: Padding(
                        padding: const EdgeInsets.only(right:0),
                        child: Container(
                          
                          decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                            bottomLeft:  Radius.circular(10),
                            topLeft: Radius.circular(6),
                            bottomRight: Radius.circular(2.5)
                          ),
                          color: Color.fromARGB(0, 243, 19, 19),
                          ),
                          height: 10,
                          width: 12,
                          
                          child: Padding(
                            padding: const EdgeInsets.only(left:3),
                            
                          ),
                        ),),)])),
               
            ],),
            SizedBox(height: 15,),
            Center(
              child: Container(
                height: 1,
                width: screenWidth/1.1,
                color: Color.fromARGB(255, 208, 208, 208),
              ),
            ),

            
             Padding(
              padding: const EdgeInsets.only(left:28.0, top:28),
              child: Text(" Ou Paypal ",style: TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 15,),

            Stack(children:[
              Center(child: Image.asset("assets/paypal.png")),
               Positioned(
                      bottom:90 ,
                      left: 310,
                      top: 0,
                      
                      child: Padding(
                        padding: const EdgeInsets.only(right:0),
                        child: Container(
                          
                          decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                            bottomLeft:  Radius.circular(10),
                            topLeft: Radius.circular(6),
                            bottomRight: Radius.circular(2.5)
                          ),
                          color: Color.fromARGB(0, 243, 19, 19),
                          ),
                          height: 10,
                          width: 12,
                          
                          child: Padding(
                            padding: const EdgeInsets.only(left:3),
                           
                          ),
                        ),),)
            ] ),
            SizedBox(height: 15,),
            Center(
              child: Container(
                height: 1,
                width: screenWidth/1.1,
                color: Color.fromARGB(255, 208, 208, 208),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left:28.0, top:28),
              child: Text(" Ou Mandat SEPA  ",style: TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 15,),

            Stack(children:[
               Center(child: Image.asset("assets/sepa.png")),
               Positioned(
                      bottom:90 ,
                      left: 310,
                      top: 0,
                      
                      child: Padding(
                        padding: const EdgeInsets.only(right:0),
                        child: Container(
                          
                          decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                            bottomLeft:  Radius.circular(10),
                            topLeft: Radius.circular(6),
                            bottomRight: Radius.circular(2.5)
                          ),
                          color: Color.fromARGB(0, 243, 19, 19),
                          ),
                          height: 10,
                          width: 12,
                          
                          child: Padding(
                            padding: const EdgeInsets.only(left:3),
                            
                          ),
                        ),),)
            ]),
            
            SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.only(left:70.0, top:20),
            //   child: Row(children: [
            //      ElevatedButton(onPressed:() {
                   
            //      },
            //                 child: 
            //                    const Text("Annuler",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 213, 43, 30), ) ,),
            //                   style:
                              
            //                   ElevatedButton.styleFrom(
                                
            //                   fixedSize: const Size(124, 46),
            //                   primary: Color.fromARGB(255, 255, 255, 255),
            //                   side: BorderSide(width: 2.0, color: Color.fromARGB(255, 213, 43, 30),),
            //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                              
            //                    )  ,
            //                   ),
            //           ),
                        
            //             Padding(
            //               padding: const EdgeInsets.only(left: 20.0),
            //               child: ElevatedButton(onPressed:() {
            //                 Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context)=> const InfoCarte()));
            //               },
            //                   child: 
            //                      const Text("Valider",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 255, 255, 255), ) ,),
            //                     style:
                                
            //                     ElevatedButton.styleFrom(
                                  
            //                     fixedSize: const Size(124, 46),
            //                     primary: Color.fromARGB(255, 14, 21, 110),
            //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                                
            //                      )  ,
            //                     ),
            //           ),
            //          ),
              //],),
           // ),
SizedBox(height: 30,)
          ]
        )
    ),
   
    );
   }
}