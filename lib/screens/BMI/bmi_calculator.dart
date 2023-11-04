
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var htInController = TextEditingController();

  var result = "";
  var msg = "";
  var bgColor = Colors.indigo.shade100!;
  String imageRes =
      "https://cdn.pixabay.com/photo/2019/03/01/11/20/obesity-4027714_640.png";

  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: bgColor,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const   Text(
                    "BMI",
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        shadows: [
                          Shadow(
                            blurRadius: 12,
                            color: Colors.white,
                          ),
                        ]),
                  ),

                  SizedBox(
                    width: media.size.width*0.9,
                    child: TextField(
                      controller: wtController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label:const Text("weight in Kilograms"),
                          labelStyle:const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,),
                          hintText: "Enter your weight in KGs",
                          hintStyle:const TextStyle(color: Colors.grey),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:const BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                   SizedBox(
                    height: media.size.height*0.02,
                  ),
                  SizedBox(
                    width: media.size.width*0.9,
                    child: TextField(
                      controller: ftController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label:const Text("Height in Feets"),
                          labelStyle:const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,),
                          hintText: "Enter your height in feets",
                          hintStyle:const TextStyle(color: Colors.grey),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:const BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: media.size.height*0.02,
                  ),
                  SizedBox(
                    width: media.size.width*0.9,
                    child: TextField(
                      controller: htInController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label:const Text("Height in Inches"),
                          labelStyle:const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,),
                          hintText: "Enter your height in Inches",
                          hintStyle:const TextStyle(color: Colors.grey),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:const BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                     SizedBox(
                       height: media.size.height*0.01,
                  ),

                  SizedBox(
                    height: 250,
                    width: 300,
                    child: Image.network(
                      imageRes,
                      scale: 1,
                    ),
                  ),
                  Text(
                    result,
                    style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: media.size.height*0.07,
                    width: media.size.width*0.4,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 12,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var inch = htInController.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            var iWt = double.parse(wt);
                            var iFt = double.parse(ft);
                            var iInch = double.parse(inch);

                            var totalInches = (iFt * 12) + iInch;

                            var totalCM = totalInches * 2.54;

                            var totalM = totalCM / 100;

                            var bmi = iWt / (totalM * totalM);

                            if (bmi > 25) {
                              msg = "You are OverWeight!!";
                              imageRes =
                              "https://cdn.pixabay.com/photo/2020/10/18/14/40/man-5665004_1280.png";

                              bgColor = Colors.orangeAccent;
                            } else if (bmi < 18) {
                              msg = "You are UnderWeight";
                              imageRes =
                              "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/13957/skinny-frog-clipart-xl.png";
                              bgColor = Colors.red;
                            } else {
                              msg = "You are Healthy";
                              imageRes =
                              "https://cdn3d.iconscout.com/3d/premium/thumb/happy-man-3423067-2868812.png";
                              bgColor = Colors.green;
                            }

                            setState(() {
                              result =
                              " $msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result =
                              "Please fill all the required blanks!!";
                            });
                          }
                        },
                        child:const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 20,
                          color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
