import 'package:bmi_calculator/pages/constants.dart';
import 'package:bmi_calculator/pages/details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightSliderValue = 1.5;
  double weightSliderValue = 50;
  double bmi =0.0;
  String status ='';

  @override
  void initState() {
    _updateBmi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          title:const Text('BMI'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: txtLabelWhite20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: heightSliderValue.toStringAsFixed(2),
                        style: txtValueWhite70,
                        children: [
                          TextSpan(text: ' m', style: txtUnitLabelWhite22
                          )

                        ]),
                  ),
                ],
              ),
              Slider(
                  value: heightSliderValue,
                  onChanged: (value){
                    setState((){
                      heightSliderValue =value;
                      _updateBmi();

                    });
                  },
                activeColor: Colors.white54,
                inactiveColor: Colors.white12,
                min: 1.2,
                max: 2.2,
                divisions: 100,
                label: heightSliderValue.toStringAsFixed(2),

                  ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Weight',
                    style: txtLabelWhite20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: weightSliderValue.round().toString(),
                        style: txtValueWhite70,
                        children: [
                          TextSpan(text: ' kg', style: txtUnitLabelWhite22
                          )

                        ]),
                  ),
                ],
              ),
              Slider(
                value: weightSliderValue,
                onChanged: (value){
                  setState((){
                    weightSliderValue =value;
                    _updateBmi();

                  });
                },
                activeColor: Colors.white54,
                inactiveColor: Colors.white12,
                min: 50,
                max: 150,
                divisions: 100,
                label: weightSliderValue.round().toString(),

              ),
              const SizedBox(height: 10,),

              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 10)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      '${bmi.toStringAsFixed(2)}',
                      style: txtValueWhite70,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    status,
                    style: txtLabelWhite40,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                    context, DetailsPage.routeName,
                    arguments: status),
                child: const Text('VIEW DETAILS'),
              ),


            ],
          ),
        ),
      ),
    );
  }

  _updateBmi() {
    bmi = weightSliderValue / (heightSliderValue * heightSliderValue);
    _updateStatus();
  }

  _updateStatus() {
    if (bmi < 16) {
      status = BMI.underweightSevere;
    } else if (bmi >= 16 && bmi <= 16.9) {
      status = BMI.underweightModerate;
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      status = BMI.underweightMild;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      status = BMI.normal;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      status = BMI.overweight;
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      status = BMI.obeseClassOne;
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      status = BMI.obeseClassTwo;
    } else {
      status = BMI.obeseClassThree;
    }
  }}
