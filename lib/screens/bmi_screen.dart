import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  var show = false;
  var weight = TextEditingController();
  var feet = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  Color? bgColor;
  String message="";
  String? weightError;
  String? feetError;
  String? inchError;
  void calculate() {
    var wt = weight.text.toString();
    var ft = feet.text.toString();
    var inch = inchcontroller.text.toString();
  
    if (wt.trim().isNotEmpty &&
        ft.trim().isNotEmpty &&
        inch.trim().isNotEmpty) {
      var iWt = int.parse(wt);
      var iFt = int.parse(ft);
      var iInchh = int.parse(inch);


      
      var tInch = (iFt * 12) + iInchh;
      var tCm = tInch * 2.54;
      var tM = tCm / 100;
      var bmi = iWt / (tM * tM);
      setState(() {
        result = " Your BMI is:  ${bmi.toStringAsFixed(2)}";
        show = true;
      });
      if (bmi > 25) {
        bgColor = Colors.red;
        message = "Your are OverWeight";
      } else if (bmi < 18) {
        bgColor = Colors.red;
        message = "Your are UnderWeight";
      } else {
        bgColor=Colors.blue;
        message = "Your are Healthy";
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please Fill all field Correctly")),
      );
      setState(() {
        result = "Calculation Failed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 238, 240),
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Text(
              "Provide Your Measurments",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 71, 57, 57),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: TextField(
              controller: weight,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  result = "";
                  show=false;
                });
              },
              decoration: InputDecoration(
                label: Text(
                  "Enter your Weight (in kg)",
                  style: TextStyle(color: Colors.grey),
                ),
                prefixIcon: Icon(Icons.monitor_weight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 143, 139, 110),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: TextField(
              controller: feet,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  result = "";
                  show=false;
                });
              },
              decoration: InputDecoration(
                label: Text(
                  "Enter your Height (in feet)",
                  style: TextStyle(color: Colors.grey),
                ),
                prefixIcon: Icon(Icons.accessibility_new),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 143, 139, 110),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: TextField(
              controller: inchcontroller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  result = "";
                  show=false;
                });
              },
              decoration: InputDecoration(
                label: Text("Enter your height (in inches)"),
                prefixIcon: Icon(Icons.accessibility_new),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 143, 139, 110),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: ElevatedButton(
              onPressed: calculate,
              child: Text("Calculate"),
            ),
          ),
         show?Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [Text(result),SizedBox(height: 20,),Text(message)]),
          ):Padding(padding: EdgeInsetsGeometry.all(10),child: Text(result),)
        ],
      ),
    );
  }
}
