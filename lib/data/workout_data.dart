import 'package:fitness_app/models/excercise.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:flutter/cupertino.dart';

class WorkoutData extends ChangeNotifier{
List<Workout> workoutList=[
 Workout(
   name:"Upper Body", 
   excercises: [
     Excercise(
         name: "Biceps Curls",
         weight: '10',
         reps: '10',
         sets: '3'
     ),
   ],
 )
];
List<Workout> getWorkoutList(){
  return workoutList;
}

int numberOfExcercisesInWorkout(String workoutName){
  Workout relevantWorkout =getRelevantWorkout(workoutName);

  return relevantWorkout.excercises.length;
}
void addWorkout(String name){
  workoutList.add(Workout(name: name, excercises: []));

  notifyListeners();
}

void addExcercise(String workoutName, String excerciseName,String weight, String reps, String sets){

  Workout relevantWorkout = getRelevantWorkout(workoutName);
  relevantWorkout.excercises.add(
    Excercise(
        name: excerciseName,
        weight: weight,
        reps: reps,
        sets: sets
    ),
  );

  notifyListeners();
}

void checkoffExcercise(String workoutName, String excerciseName){
  Excercise relevantExcercise =getRelevantExcercise(workoutName, excerciseName);

  relevantExcercise.isCompleted=!relevantExcercise.isCompleted;

  notifyListeners();
}

Workout getRelevantWorkout(String workoutName){
  Workout relevantWorkOut = workoutList.firstWhere((workout) => workout.name==workoutName);

  return relevantWorkOut;
}

Excercise getRelevantExcercise(String workoutName, String excerciseName){
  Workout relevantWorkout = getRelevantWorkout(workoutName);

  Excercise relevantExcercise =relevantWorkout.excercises.firstWhere((excercise) => excercise.name == excerciseName);

  return relevantExcercise;
}
}