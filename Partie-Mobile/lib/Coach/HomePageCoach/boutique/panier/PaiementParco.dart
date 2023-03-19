import 'package:app_parent/Boutique/panier/InfoLivraison.dart';
import 'package:app_parent/Boutique/panier/infoprelev.dart';
import 'package:app_parent/Boutique/panier/informationcarte.dart';
import 'package:app_parent/Coach/HomePageCoach/boutique/panier/InfoLivraisonco.dart';
import 'package:app_parent/Coach/HomePageCoach/boutique/panier/infoprelevco.dart';
import 'package:app_parent/Coach/payementco/infocartecoach.dart';
import 'package:app_parent/HomeScreen/InfoCarte.dart';
import 'package:flutter/material.dart';


class PayParco extends StatefulWidget {
  const PayParco({Key? key}) : super(key: key);

  @override
  State<PayParco> createState() => _PayParState();
}

class _PayParState extends State<PayParco> {
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
      return const Color.fromARGB(255, 36, 145, 15);
    }
      final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
      automaticallyImplyLeading: false,
        leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const InfoLIvco()));
        },
icon:const Icon(Icons.arrow_back_outlined,size: 25,)),  
    title: const Text(' paeiment par ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView(

        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.only(left:28.0, top:28),
              child: Text(" Par Carte Crédit ",style:  TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                
               padding: const EdgeInsets.all(8),
                 child: Stack(
                   
                   alignment: Alignment.centerRight,
                   children: [
                     InkWell(
              
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Infocarco()));
                     },
                                   child: Image.asset("assets/OB.png"),

              )])),
                      
                Container(
               padding: const EdgeInsets.all(8),
                 child: Stack(
                   
                   alignment: Alignment.centerRight,
                   children: [
                     InkWell(
             
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Infocarco()));
},
                  child: Image.asset("assets/visaa.png"),
                   
                          
                )])),
               
            ],),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
              
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Infocarco()));
},
              child:Image.asset("assets/mastercard.png")),
                
                   
                 InkWell(
               
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Infocarco()));
},
                 child:  Image.asset("assets/American.png")),
                   
               
            ],),
            const SizedBox(height: 15,),
            Center(
              child: Container(
                height: 1,
                width: screenWidth/1.1,
                color: const Color.fromARGB(255, 208, 208, 208),
              ),
            ),

            
             const Padding(
              padding: EdgeInsets.only(left:28.0, top:28),
              child:  Text(" Ou Paypal ",style: TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
            ),
            const SizedBox(height: 15,),

            Stack(children:[
              Center(child: Image.asset("assets/paypal.png")),
               
            ] ),
            const SizedBox(height: 15,),
            Center(
              child: Container(
                height: 1,
                width: screenWidth/1.1,
                color: const Color.fromARGB(255, 208, 208, 208),
              ),
            ),
             const Padding(
              padding: EdgeInsets.only(left:28.0, top:28),
              child: Text(" Ou Mandat SEPA  ",style: TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
            ),
            const SizedBox(height: 15,),

            Stack(children:[
               Center(child:
               
               
               InkWell(
              
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const infoprevco()));
},
                child:Image.asset("assets/sepa.png"))),
               ]),
            
            const SizedBox(height: 20,),
            
            
                      
                 const SizedBox(height: 30,),
                            Container(
              height: screenHeight/2.6,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left:49.0, top:40),
                          child: Text("SOUS-TOTAL  :",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 117, 117, 117) )),
                        ),
                        Padding(
                           padding: EdgeInsets.only(right:30.0, top:25),
                          child: Text("135.568£ ",style:TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 21, 10, 110) )),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(child: Container(height: 1, width: screenWidth/1.1, color: const Color.fromARGB(255, 214, 214, 214),)),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left:49.0, top:25),
                          child: Text("TAX  :",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 117, 117, 117) )),
                        ),
                        Padding(
                           padding: EdgeInsets.only(right:30.0, top:25),
                          child: Text("20% ",style:TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 21, 10, 110) )),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(child: Container(height: 1, width: screenWidth/1.1, color: const Color.fromARGB(255, 214, 214, 214),)),
                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left:49.0, top:25),
                          child: Text("Livraison  :",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 117, 117, 117) )),
                        ),
                        Padding(
                           padding: EdgeInsets.only(right:30.0, top:25),
                          child: Text("----- ",style:TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 21, 10, 110) )),
                        )
                      ],
                    ),
                    
                    
                       Row(
                        children:  [
                          Padding(
                            padding: const EdgeInsets.only(left:34.0, top:1),
                            child: 
                            IconButton(onPressed:(){}, icon:const Icon(Icons.info_outline, color: Color.fromARGB(255, 3, 78, 140),)
                            )
                          ),
                          Expanded(child:  Padding(
                            padding: EdgeInsets.only(top:10.0),
                            child: Text("La livraison et les taxes sont calculées une fois l'étape de livraison terminée  ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 14, 21, 110) )),
                          ))
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Center(child: Container(height: 1, width: screenWidth/1.1, color: const Color.fromARGB(255, 14, 21, 110),)),
                     const SizedBox(height: 20,),
                      const Center(child: Text("Total : 215.100 £",style:TextStyle(fontSize: 16,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: const Color.fromARGB(255, 14, 21, 110) )))
                ]))
          ]
        )
    ),
    
    );
   }
}