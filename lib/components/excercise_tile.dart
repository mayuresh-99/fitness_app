import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ExcerciseTile extends StatelessWidget {
  ExcerciseTile({super.key, required this.excerciseName, required this.weight, required this.reps, required this.sets, required this.isCompleted,  required this.onCheckBoxChanged});

  final String excerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        tileColor: Colors.purple[100],
        title: Text(excerciseName),
        subtitle: Row(
          children: [
            Chip(
              label: Text("${weight}kg"),
            ),
            Chip(
              label: Text("${reps}reps"),
            ),
            Chip(
              label: Text("${sets}sets"),
            ),
          ],
        ),
        leading: Checkbox(
          value: isCompleted,
          onChanged: (value){
            onCheckBoxChanged!(value);
          },
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: Colors.red,),
        ),
      ),
    );
  }
}
