import 'package:app_parent/Calendrier/Calendrier.dart';
import 'package:app_parent/Calendrier/InfoEven.dart';
import 'package:app_parent/Calendrier/event.dart';
import 'package:app_parent/HomeScreen/home/homescreen.dart';
import 'package:app_parent/models/Evenemenet.dart';
import 'package:date_format/date_format.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
    getevenement();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  List<Evenement> futureData = [];

  getevenement() async {
    futureData = await FetchEvenement();
    setState(() {
      print(futureData);
    });
  }

  Future<List<Evenement>> FetchEvenement() async {
    List<Evenement> evenement = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
        Uri.parse('http://172.16.130.41:8080/projet/evenement'),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      evenement =
          List<Evenement>.from(l.map((model) => Evenement.fromJson(model)));
      return evenement;
    } else {
      return evenement;
    }
  }

  // Widget Calend (Evenement event) {
  //   final screenHeight=MediaQuery.of(context).size.height;
  //   final screenWidth=MediaQuery.of(context).size.width;
  //   return
  //     Column(children: [
  //       Container(
  //            height:screenHeight/23.6 ,
  //             width: screenWidth/1.10,
  //             decoration: const BoxDecoration(
  //             borderRadius:  BorderRadius.only(
  //             topRight :Radius.circular(10),
  //              topLeft: Radius.circular(10),
  //           ),
  //           color: Colors.white),

  //     child:

  //            Center(child: Text(event.titre.toString(), style: const TextStyle(color:Color.fromARGB(255, 14, 21, 110) ,fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 13), textAlign: TextAlign.center,)),

  //           ),
  //           const SizedBox(height: 2),

  //            GestureDetector(
  //       onTap: (){
  //        Navigator.of(context).push(
  //               MaterialPageRoute(builder: (context)=> const InfoEven()));
  //       },

  //              child:Stack(
  //                children:[ Container(
  //                           height:screenHeight/5.7 ,
  //                            width: screenWidth/1.10,
  //                            decoration: const BoxDecoration(
  //                            borderRadius:  BorderRadius.only(
  //                bottomLeft: Radius.circular(5),
  //                            bottomRight: Radius.circular(5),
  //                         ),
  //                          color: Colors.white),
  //                          child:Column(children :[
  //                           Padding(
  //                padding: const EdgeInsets.all(8.0),
  //                child: Row(

  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,

  //                 children: [

  //                 Padding(
  //                   padding: const EdgeInsets.only(left:12.0),
  //                   child: Image.asset("assets/team0.png",alignment:Alignment.centerLeft),
  //                 ),

  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                    const Text("Ce Evenemenet sera lieu ",style:  TextStyle(color: Color.fromARGB(255,119, 131, 143),fontSize: 12,fontWeight:FontWeight.w600 )),
  //                 Text(event.date.toString(),style: const TextStyle(color: Color.fromARGB(255,119, 131, 143),fontSize: 12,fontWeight:FontWeight.w600 )),

  //                   ]
  //                 ),
  //                  Padding(
  //                    padding: const EdgeInsets.only(right:15.0),
  //                    child: Image.asset("assets/team1.png"),
  //                  ),

  //                          ]
  //                          ),
  //                           ),

  //                    Padding(
  //                      padding: const EdgeInsets.only(top:13.0),
  //                      child: Container(
  //                        height: 35,
  //                        child: Row(
  //                          mainAxisAlignment: MainAxisAlignment.end,
  //                          //crossAxisAlignment:  CrossAxisAlignment. ,
  //                          children: [

  //                          ElevatedButton(
  //                          child: const Text('',style:TextStyle(fontSize: 11, fontFamily:'Poppins',fontWeight:FontWeight.w400, color: Colors.white  )),
  //                          onPressed: (){

  //                          },

  //                          style:ElevatedButton.styleFrom(
  //                            shape: RoundedRectangleBorder(
  //                              borderRadius: BorderRadius.circular(0)
  //                            ),
  //                          primary:const Color.fromARGB(255, 14, 21, 110) ,
  //                          fixedSize: const Size(186, 35),
  //                                ),
  //                        ),
  //                         ElevatedButton(
  //                         child: const Text('',style:TextStyle(fontSize: 11, fontFamily:'Poppins',fontWeight:FontWeight.w400, color: Colors.white  )),
  //                         onPressed: (){},
  //                         style:ElevatedButton.styleFrom(
  //                            fixedSize: const Size(188, 35),
  //                            shape: RoundedRectangleBorder(
  //                              borderRadius: BorderRadius.circular(0)
  //                            ),
  //                         primary:const Color.fromARGB(255, 119,129, 248) ,
  //                                ),
  //                        )
  //                        ]

  //                        ),
  //                      ),
  //                    )] )),
  //     ]))]);
  //           }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 21, 110),
        title: const Text("Calendrier"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Home()));
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text("Please Select The Day to See the events",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber)),

            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: screenWidth / 1.07,
                color: Colors.white,
                child: TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  daysOfWeekVisible: true,

                  //Day Changed
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Calendrier(
                              events:
                                  Evenement(date: selectedDay.toString()))));
                    });
                    print(focusedDay);
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },

                  eventLoader: _getEventsfromDay,

                  //To style the Calendar
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 43, 30),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    selectedTextStyle: const TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 43, 30),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                      weekendStyle: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w500)),

                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    formatButtonTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Text(
                  event.title,
                ),
              ),
            ),

            const SizedBox(height: 23),
            // Container(
            //   child: Row(children: [
            //     Container(
            //       child: Image.asset("assets/clock.png"),

            //       margin: const EdgeInsets.all(12),
            //       height: screenHeight/16.8 ,
            //       width: screenWidth/7.04,
            //       decoration:BoxDecoration (
            //       borderRadius: BorderRadius.circular(17),
            //       color: const Color.fromARGB(255, 236, 238, 255)
            //     )
            //     ),
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children:  [
            //         Text(selectedDay.toString(), style: const TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w500) ,),
            //         const Text("Arrivé 8:30 - Départ 11:35 am ",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 153, 153, 160)),),
            //         const Text("Coach Leo",style:  TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 153, 153, 160)),),
            //         ],
            //     )
            //   ]
            //   ),

            //    height: screenHeight/10.86 ,
            // width: screenWidth/1.1,
            // decoration: BoxDecoration(
            //      color: Colors.white,
            //      borderRadius: BorderRadius.circular(10),
            //    ),
            // ),
            // const SizedBox(height: 18),
            // Container(
            //   child: Row(children: [
            //     Container(
            //       child: Image.asset("assets/ballon.png"),

            //       margin: const EdgeInsets.all(12),
            //       height: screenHeight/16.8 ,
            //       width: screenWidth/7.04,
            //       decoration:BoxDecoration (
            //       borderRadius: BorderRadius.circular(17),
            //       color: const Color.fromARGB(255, 236, 238, 255)
            //     )
            //     ),

            //    Column(
            //      mainAxisAlignment: MainAxisAlignment.center,
            //      crossAxisAlignment: CrossAxisAlignment.start,
            //      children:  const [
            //        Text("Entrainement", style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w500) ,),
            //        Text("De 8:30 - jusqu'a 11:35 am ",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 153, 153, 160)),),
            //        Text("Coach fréderic",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color.fromARGB(255, 153, 153, 160)),),
            //        ],
            //    )
            //   ]
            //   )
            //   ,
            //    height: screenHeight/8.39 ,
            // width: screenWidth/1.1,
            // decoration: BoxDecoration(
            //      color: Colors.white,
            //      borderRadius: BorderRadius.circular(10),
            //    ),
            // ),

            const SizedBox(height: 18),

            const SizedBox(
              height: 30,
            ),
            //         ListView.separated(
            //          separatorBuilder: (context, index) => const SizedBox(

            //   height: 20,

            // ),
            //         scrollDirection: Axis.vertical,
            //         addSemanticIndexes: true,

            //         itemCount: futureData.length,
            //         primary: false,
            //         shrinkWrap: true,
            //         itemBuilder: (context,index){
            //           return
            //           InkWell(onTap:(){
            //             Navigator.of(context).push(
            //             MaterialPageRoute(builder: (context)=> const InfoEven()));
            //           }, child :Calend(futureData[index]));
            //         }
            //       ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            unselectedItemColor: const Color.fromARGB(255, 14, 21, 110),
            selectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 14, 21, 110),
                decorationColor: Color.fromARGB(255, 14, 21, 110),
                fontFamily: 'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 14, 21, 110),
                decorationColor: Color.fromARGB(255, 14, 21, 110),
                fontFamily: 'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.w500),
            backgroundColor: const Color.fromARGB(255, 14, 21, 110),
            fixedColor: const Color.fromARGB(255, 14, 21, 110),
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      right: 12,
                    ),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              //  Navigator.of(context).push(
                              //        MaterialPageRoute(builder: (context)=> const Home()));
                            },
                            icon: const Icon(
                              Icons.home_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Acceuil"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              // Navigator.of(context).push(
                              //       MaterialPageRoute(builder: (context)=> const Calendrier()));
                            },
                            icon: const Icon(
                              Icons.calendar_today,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Calendrier"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              //  Navigator.of(context).push(
                              //       MaterialPageRoute(builder: (context)=> const ListMsg()));
                            },
                            icon: const Icon(
                              Icons.message_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Message"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
//Navigator.of(context).push(
                              //                MaterialPageRoute(builder: (context)=> const Outil()));
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Mes Outils"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
            ]),
      ),
    );
  }
}
