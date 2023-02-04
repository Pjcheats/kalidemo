import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalidemo/Pages/filter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            buildingsEnabled: false,
            compassEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.white,
                    Color.fromARGB(0, 255, 255, 255)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        Text('VENUES NEAR YOU',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterPage()));
                          },
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,

                          ),
                            hintText: 'e.g. burger, fries, pasta',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    '1100 S FLOWER St',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Los Angeles, CA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(bottom: 35.0),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      padding: EdgeInsets.only(right: 20),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Image.asset("image/food.png"),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1. The Palm los angeles',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.send,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                             ' 240 m',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 20,
                                            color: Color.fromARGB(255, 88, 95, 237),
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 20,
                                            color: Color.fromARGB(255, 88, 95, 237),
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 20,
                                            color: Color.fromARGB(255, 88, 95, 237),
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 20,
                                            color: Color.fromARGB(255, 88, 95, 237),
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 20,
                                            color: Color.fromARGB(255, 88, 95, 237),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                             ' 12 reviews',
                                            style: TextStyle(
                                              fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 88, 95, 237),)
                                          ),
                                          
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                         'Burgers. Pasta. Hot vine',
                                        style: TextStyle(
                                          fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,)
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: BottomAppBar(
          notchMargin: 7,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 88, 95, 237),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.trending_up_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 88, 95, 237),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Activity",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 88, 95, 237),
        onPressed: () {},
        child: Icon(
          Icons.edit_calendar_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
