import 'package:fitness_app/models/excercise.dart';

class Workout{
  final String name;
  final List<Excercise> excercises;

  Workout({required this.name, required this.excercises});
}