import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
import 'package:shipping_app/screens/order/new_order_screens/step1.dart';
import 'package:shipping_app/screens/order/new_order_screens/step2.dart';
import 'package:shipping_app/screens/order/new_order_screens/step3.dart';
import 'package:shipping_app/shared/side_menu.dart';
import 'package:shipping_app/shared/top_navigation.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeStepIndex = 0;

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('New Order'),
          content: const newOrderForm(),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Address'),
            content: Container(
              height: MediaQuery.of(context).size.height*0.6,
              child:AddOrderDetails()
            )
        ),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Confirm'),
            content: const viewOrderList(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Style.blueAccentPageBackgroundColor,
      drawer: SideMenu(),
      appBar: const TopNavBar(),
      body: SafeArea(
    child: SingleChildScrollView(
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                " New Order",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1.0,right: 1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.8,
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _activeStepIndex,
                    controlsBuilder: (BuildContext context, ControlsDetails controls) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controls.onStepContinue,
                              child: _activeStepIndex != 2
                                  ? const Text("Next")
                                  : const Text("Make Payment"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Style.blueAccentPageBackgroundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controls.onStepCancel,
                              child: const Text('Cancel'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Style.blueAccentPageBackgroundColor,
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.lightBlueAccent,
                                  )),
                            ),
                          ),
                        ],
                      );
                    },
                    steps: stepList(),
                    onStepContinue: () {
                      if (_activeStepIndex < (stepList().length - 1)) {
                        setState(() {
                          _activeStepIndex += 1;
                        });
                      } else {
                        print('Submited');
                      }
                    },
                    onStepCancel: () {
                      if (_activeStepIndex == 0) {
                        return;
                      }

                      setState(() {
                        _activeStepIndex -= 1;
                      });
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _activeStepIndex = index;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 5,),
            ],
          ),
        ),
      ],
    ),
    ),
    ),
      bottomNavigationBar: BottomNavigation(),


    );
  }
}

