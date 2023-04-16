import 'package:fitness_app/data/workout_data.dart';
import 'package:fitness_app/models/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id ="home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex =0;
  // late PageController _pageController;
  //
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _pageController =PageController();
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _pageController.dispose();
  //   super.dispose();
  //
  // }

  final newWorkoutNameController = TextEditingController();
  void createNewWorkout(){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('Create new Workout'),
          content: TextField(
            controller: newWorkoutNameController,
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
        ),);
  }

  void goToworkoutPage(String workoutName){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkoutPage(workoutName: workoutName,),));

  }
  void save(){
    String newWorkoutName = newWorkoutNameController.text;
    Provider.of<WorkoutData>(context,listen: false).addWorkout(newWorkoutName);

    Navigator.pop(context);
    clear();
  }
  void cancel(){
    Navigator.pop(context);
    clear();
  }

  void clear(){
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child)=>Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          backgroundColor: Colors.purple,
        title: Text('Workout Tracker'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: createNewWorkout,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: value.getWorkoutList().length,
            itemBuilder: (context,index)=>ListTile(
              contentPadding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              title: Text(value.getWorkoutList()[index].name),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_outlined,),
              onPressed: ()=> goToworkoutPage(value.getWorkoutList()[index].name),
              ),
            ),
        ),
      ),
    );
  }
}





