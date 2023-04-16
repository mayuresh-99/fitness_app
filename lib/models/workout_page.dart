import 'package:fitness_app/components/excercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_app/data/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key, required this.workoutName}) : super(key: key);
  final String workoutName;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  void onCheckBoxChanged(String workoutName, String excerciseName){
    Provider.of<WorkoutData>(context, listen: false)
        .checkoffExcercise(workoutName, excerciseName);
  }

  final excerciseNameController= TextEditingController();
  final weightController= TextEditingController();
  final repsController= TextEditingController();
  final setsController= TextEditingController();


  void createNewExcercise(){
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text('Add a new excercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: excerciseNameController,
              ),
              TextField(
                controller: weightController,
              ),
              TextField(
                controller: repsController,
              ),
              TextField(
                controller: setsController,
              ),
            ],
          ),
          actions: [
            MaterialButton(
            onPressed: save,
            child: Text("Save"),
          ),
            MaterialButton(
              onPressed: cancel,
              child: Text("Cancel"),
            ),
          ],
        ),
    );
  }
  void save(){
    String newExcerciseName = excerciseNameController.text;
    String weight = weightController.text;
    String reps = repsController.text;
    String sets = setsController.text;
    Provider.of<WorkoutData>(context,listen: false).addExcercise(
      widget.workoutName,
      newExcerciseName,
      weight,
      reps,
      sets
    );

    Navigator.pop(context);
    clear();
  }
  void cancel(){
    Navigator.pop(context);
    clear();
  }

  void clear(){
    excerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child)=> Scaffold(
          backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text(widget.workoutName),
      backgroundColor: Colors.purple,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: createNewExcercise,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: value.numberOfExcercisesInWorkout(widget.workoutName),
          itemBuilder: (context,index)=> ExcerciseTile(
              excerciseName: value.getRelevantWorkout(widget.workoutName).excercises[index].name,
              weight: value.getRelevantWorkout(widget.workoutName).excercises[index].weight,
              reps: value.getRelevantWorkout(widget.workoutName).excercises[index].reps,
              sets: value.getRelevantWorkout(widget.workoutName).excercises[index].sets,
              isCompleted: value.getRelevantWorkout(widget.workoutName).excercises[index].isCompleted,
            onCheckBoxChanged: (val)=> onCheckBoxChanged(
              widget.workoutName,
              value.getRelevantWorkout(widget.workoutName).excercises[index].name,
            ),
          ),
    ),
        ),
    );
  }
}

