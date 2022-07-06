import 'package:butterfly/shared/menu_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeightTracker extends StatefulWidget {
  const WeightTracker({Key? key}) : super(key: key);

  @override
  State<WeightTracker> createState() => _WeightTrackerState();
}

class _WeightTrackerState extends State<WeightTracker> {
  final double fontSize = 18;
  final TextEditingController txtWeightController = TextEditingController();
  final TextEditingController txtHeightController = TextEditingController();
  final TextEditingController txtNotesController = TextEditingController();
  String heightMessage = '';
  String weightMessage = '';
  String result = '';
  String notes = '';
  String whereMeasured = '';
  DateTime dateMeasured = DateTime.now();
  double? weight;
  double? height;

  // These are used to know which togglebutton is selected
  bool isImperial = false;
  bool isMetric = false;

  // late keyword means it will be initialized after the constructor is called
  late List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage = 'Enter your height in ${isMetric ? 'meters' : 'inches'}';
    weightMessage = 'Enter your weight in ${isMetric ? 'kg' : 'pounds'}';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Weight Tracker'),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: MenuDrawer(),
        // SingleChildScrollView replaces Container - allowing for rotation and scrollable region
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                ToggleButtons(
                    isSelected: isSelected,
                    onPressed: toggleMeasure,
                    // make both toggle buttons the same size
                    constraints: const BoxConstraints(
                        minWidth: 70,
                        maxWidth: 140,
                        minHeight: kMinInteractiveDimension),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child:
                            Text('Metric', style: TextStyle(fontSize: fontSize)),
                        //Icon(Icons.add_comment)
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Imperial',
                            style: TextStyle(fontSize: fontSize)),
                        //Icon(Icons.add_comment)
                      )
                    ]),
                Container(
                    margin: const EdgeInsets.all(10),
                    width: 200,
                    child: TextField(
                      controller: txtHeightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: heightMessage,
                          labelText: 'Height',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                      style: TextStyle(fontSize: 14),
                    )),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 200,
                  child: TextField(
                    controller: txtWeightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: weightMessage,
                        labelText: 'Weight',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Body Mass Index"),
                        content: Text(result),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              color: Colors.blueAccent,
                              padding: const EdgeInsets.all(14),
                              child: const Text("Ok",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child:
                      Text('Calculate BMI', style: TextStyle(fontSize: fontSize)),
                ),
              ])),
        ));
  }

  void calculateBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeightController.text) ?? 0;
    double weight = double.tryParse(txtWeightController.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else if (isImperial) {
      bmi = weight * 703 / (height * height);
    }
    if (kDebugMode) {
      print("BMI Calculation: $bmi");
    }
    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else if (value == 1) {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
      var pressed = "Metric";
      if (isImperial) {
        pressed = "Imperial";
      }
      print("Measurement Pressed $pressed");
    });
  }
}
