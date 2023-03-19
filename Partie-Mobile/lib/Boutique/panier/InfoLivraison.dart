import 'package:app_parent/Boutique/panier/PaiementPar.dart';
import 'package:app_parent/Boutique/panier/panier.dart';
import 'package:app_parent/Outil/favoris/favoris.dart';
import 'package:app_parent/models/produit.dart';
import 'package:flutter/material.dart';
class InfoLIv extends StatefulWidget {
  
  const InfoLIv({Key? key}) : super(key: key);

  @override
  State<InfoLIv> createState() => _InfoLIvState();
}

class _InfoLIvState extends State<InfoLIv> {

Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
 return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
     appBar: AppBar(
    title: const Text('Informations pour la livrasion',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 00.5,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ,
    automaticallyImplyLeading: false,
     leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> panier1(prod: Produit())));
        },
       icon:const Icon(Icons.arrow_back_outlined,size: 25,)),
                
      
        
     ),
     body: SingleChildScrollView(
       child: Column(children: [
         SizedBox(height: 30,),
         Center(
           child: Container(
              width: screenWidth/1.2,
              height: 45,
              child: TextFormField(
                         
                          //maxLength: 25,
                          decoration: const InputDecoration(
                            suffixIcon: 
                             Icon(Icons.person,color: Color.fromARGB(255, 0, 73, 133),),
                          fillColor:  Color.fromARGB(255, 226, 227, 244), 
                          filled: true,
                         labelText: 'Nom*',
                         // hintText:'Saisissez votre nom ' ,
                          hintStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                          labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                                ),
                          validator: (value) {
                          if (value!.isEmpty) {
                          return 'Veuillez saisir un texte';
                                }
                          return null;
                                },
                                ),
            ),
         ),
                            const SizedBox(height :17),
                            Container(
                              width: screenWidth/1.2,
                               height: 45,
                              child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                        Icon(Icons.person,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                     labelText: 'Prénom*',
                      //hintText:'Saisissez votre prénom' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                              }
                      return null;
                              },
                     ),
                            ),
                
          const SizedBox(height:17 ),
          
          Container(
            width: screenWidth/1.2,
             height: 45,
            child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                         Icon(Icons.phone,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'Télephone*',
                      
                      
                      
                      hintText:' (+33) xx xx xx xx' ,
                      
                      
                      hintStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color:  Color.fromARGB(255, 180, 180, 180)),
                      labelStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                            ),
                              const SizedBox(height: 17,),
                             Container(
                              width: screenWidth/1.2,
                               height: 45,
                               child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                         Icon(Icons.mail,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor:  Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'E-mail*',
                     // hintText:'exemple@mail.com ' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                             ),
                            const SizedBox(height :17),
                             Container(
            width: screenWidth/1.2,
             height: 45,
            child: TextFormField(
                       
                        //maxLength: 25,
                        decoration: const InputDecoration(
                          suffixIcon: 
                           Icon(Icons.location_on_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                        fillColor:  Color.fromARGB(255, 226, 227, 244), 
                        filled: true,
                       labelText: 'Adresse*',
                        //hintText:'Saisissez votre nom ' ,
                        hintStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                        labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                        validator: (value) {
                        if (value!.isEmpty) {
                        return 'Veuillez saisir un texte';
                              }
                        return null;
                              },
                              ),
          ),
                            const SizedBox(height :17),
                            Container(
                              width: screenWidth/1.2,
                               height: 45,
                              child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                        Icon(Icons.location_on_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                     labelText: "Complément d'adresse*",
                      //hintText:'Saisissez votre prénom' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                              }
                      return null;
                              },
                     ),
                            ),
                
          const SizedBox(height:17 ),
          
          Container(
            width: screenWidth/1.2,
             height: 45,
            child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                         Icon(Icons.navigate_next_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor:  Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'Code Postal*',
                      
                      
                      
                      //hintText:' (+33) xx xx xx xx' ,
                      
                      
                      hintStyle: const TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: const TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                            ),
                              const SizedBox(height: 17,),
                             Container(
                              width: screenWidth/1.2,
                               height: 45,
                               child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                        const Icon(Icons.navigate_next_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: const Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'Ville*',
                      //hintText:'exemple@mail.com ' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: const TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                             ),
                             SizedBox(height: 30,),
                             Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(left:51.0),
                                child: ElevatedButton(onPressed: () {
                                   Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>  panier1(prod:Produit())));
                        
                                }, 
                    child: const Text('Annuler',style: TextStyle(fontSize:14, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 153, 13, 13)),),
                            style:  ElevatedButton.styleFrom(
                            
                          fixedSize: const Size(124, 46),
                          primary: const Color.fromARGB(255, 255, 255, 255),
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),

                          
                           )
                             ,
                          ),
                    
                    
                    ),
                    
                              ),
                    const SizedBox(width:26 ,),
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const PayPar()));
                    }, 
                    child: const Text('Valider',style: TextStyle(fontSize:14, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 255, 255, 255))),
                    style:  ElevatedButton.styleFrom(
                            
                          fixedSize: const Size(124, 46),
                          primary: const Color.fromARGB(255, 14, 21, 110),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                           )  ,
                          ),
                    ),
                            ],),
                            SizedBox(height: 30,),
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
                    SizedBox(height: 15),
                    Center(child: Container(height: 1, width: screenWidth/1.1, color: Color.fromARGB(255, 214, 214, 214),)),
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
                    SizedBox(height: 15),
                    Center(child: Container(height: 1, width: screenWidth/1.1, color: Color.fromARGB(255, 214, 214, 214),)),
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
                            padding: EdgeInsets.only(left:34.0, top:1),
                            child: 
                            IconButton(onPressed:(){}, icon:Icon(Icons.info_outline, color: Color.fromARGB(255, 3, 78, 140),)
                            )
                          ),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Text("La livraison et les taxes sont calculées une fois l'étape de livraison terminée  ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 14, 21, 110) )),
                          ))
                        ],
                      ),
                      SizedBox(height: 10,),
                      Center(child: Container(height: 1, width: screenWidth/1.1, color: Color.fromARGB(255, 14, 21, 110),)),
                     SizedBox(height: 20,),
                      Center(child: Text("Total : 215.100 £",style:TextStyle(fontSize: 16,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )))
                ]))
        ]
       )
     )
 );
}

}