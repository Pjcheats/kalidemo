import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalidemo/Components/filter_selection_chip.dart';

import '../Components/applied_filter_chip.dart';

List<String> ChipList = ['<10km'];

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _value = 10;
  bool isOpen = true;
  bool isFree = true;
  TextStyle _textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Text('SEARCH FILTER',
                      style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold
                              ,fontSize: 18
                            )),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Apply',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Applied filters",
                style: _textStyle,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: ChipList.isEmpty ? 0 : 35,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: ChipList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return AppliedFilterChip(
                    label: ChipList[index],
                    Callback: () {
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Ethnic Cuisines",
                style: _textStyle,
              ),
            ),
            Container(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    FilterSelectionChip(
                      label: 'Mexican',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                    FilterSelectionChip(
                      label: 'Italian',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                    FilterSelectionChip(
                      label: 'Greek',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                    FilterSelectionChip(
                      label: 'South Indian',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Popular food",
                style: _textStyle,
              ),
            ),
            Container(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    FilterSelectionChip(
                      label: 'Burger',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                    FilterSelectionChip(
                      label: 'Hot Vine',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                    FilterSelectionChip(
                      label: 'Pasta',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                    FilterSelectionChip(
                      label: 'Pizza',
                      Callback: () {
                        setState(() {});
                      },
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Distance",
                    style: _textStyle,
                  ),
                  Slider(
                    activeColor: Color.fromARGB(255, 88, 95, 237),
                    inactiveColor: Color.fromARGB(255, 136, 141, 230),
                    thumbColor: Color.fromARGB(255, 88, 95, 237),
                    value: _value,
                    min: 1,
                    max: 50,
                    divisions: 49,
                    onChangeStart: (value) {
                      setState(() {
                        ChipList.remove('<${value.floor().toString()}' 'km');
                      });
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        ChipList.add('<${value.floor().toString()}' 'km');
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1km",
                        style: _textStyle,
                      ),
                      Text(
                        "50km",
                        style: _textStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Now Open",
                        style: _textStyle,
                      ),
                      Switch(
                          value: isOpen,
                          activeColor: Color.fromARGB(255, 88, 95, 237),
                          onChanged: (value) {
                            setState(() {
                              isOpen = value;
                            });
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free Reservation",
                        style: _textStyle,
                      ),
                      Switch(
                        value: isFree,
                        activeColor: Color.fromARGB(255, 88, 95, 237),
                        onChanged: (value) {
                          setState(
                            () {
                              isFree = value;
                            },
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
