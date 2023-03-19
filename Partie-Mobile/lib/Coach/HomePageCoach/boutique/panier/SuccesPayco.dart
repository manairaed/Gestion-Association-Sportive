import 'package:flutter/material.dart';
class Succesco extends StatefulWidget {
  const Succesco({Key? key}) : super(key: key);

  @override
  State<Succesco> createState() => _SuccesState();
}
class _SuccesState extends State<Succesco> {
   @override
   Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
      

    title: const Text(' Succès Paiement',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView(

        child: Center(
          child: Column( 
            children: [
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: Text("Félicitation,",style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500 , color: Color.fromARGB(255, 14, 21, 110)),),
                ),
                Text("Monsieur Micheal Flores ",style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),),
              SizedBox(height: 20,),
              Text("Votre paiement a été effectué avec succés ",style: TextStyle(fontSize: 13 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 14, 21, 110)),),
              
              Padding(
                padding: const EdgeInsets.only(left:75.0, top:20),
                child: Row(
                  children: [
                    Text("Numéro de transaction :  ",style: TextStyle(fontSize: 13 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 238, 26, 26)),),
                    Text("14848554   ",style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 238, 26, 26)),),

                  ],
                ),
              ),
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
                    const Center(child: Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text("Information de facturation",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Colors.black ) ,),
                    )),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left:49.0, top:25),
                          child: Text("Titulaire de la carte :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                        ),
                        Padding(
                           padding: EdgeInsets.only(left:49.0, top:25),
                          child: Text("Emna testttesst ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                      ],
                    ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Total Payé :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("150.26£ ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                       Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("TAX:",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("20% ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                       Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Paiement Par:",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("Crédit Card ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                       Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Date De Transactions:",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("30/03/2022 ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: ElevatedButton(onPressed:() {
                         
                        },
                          child: 
                             const Text("Demande Facture",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ) ,),
                            style:
                            
                            ElevatedButton.styleFrom(
                              
                            fixedSize: const Size(220, 46),
                            primary: const Color.fromARGB(255, 213, 43, 30),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                             )  ,
                            ),
                    ),
                      ),
              ]
              )
            ),
            ]
          ),
        )
    )
    );
   }
}

  