import 'package:flutter/material.dart';
import 'package:kalidemo/Pages/filter_page.dart';

class FilterSelectionChip extends StatefulWidget {
  FilterSelectionChip({super.key, required this.label,required this.Callback});
  String label;
  void Function() Callback;

  @override
  State<FilterSelectionChip> createState() => _FilterSelectionChipState();
}

class _FilterSelectionChipState extends State<FilterSelectionChip> {

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                setState(() {
                  ChipList.contains(widget.label)
                      ? ChipList.remove(widget.label)
                      : ChipList.add(widget.label);
                  widget.Callback();
                });
                
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ChipList.contains(widget.label)
                        ? Color.fromARGB(255, 88, 95, 237)
                        : Colors.transparent,
                    border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 88, 95, 237))),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Icon(
                    ChipList.contains(widget.label) ? Icons.check_rounded : Icons.add,
                    size: 18,
                    color: ChipList.contains(widget.label)
                        ? Colors.white
                        : Color.fromARGB(255, 88, 95, 237),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
