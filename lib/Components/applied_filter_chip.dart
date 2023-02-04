import 'package:flutter/material.dart';
import 'package:kalidemo/Pages/filter_page.dart';

class AppliedFilterChip extends StatelessWidget {
  AppliedFilterChip({super.key,required this.label,required this.Callback});

  String label;
  void Function() Callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(240, 240, 255, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    ChipList.remove(label);
                    Callback();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 88, 95, 237),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.close,
                          size: 12,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
