import 'package:flutter/material.dart';
import 'package:shipping_app/screens/order/new_order_screens/add_order_details.dart';
import 'package:shipping_app/screens/order/new_order_screens/add_order_dimension.dart';
import 'package:shipping_app/screens/order/new_order_screens/order_confirmation.dart';
import '../../../constants/styles.dart';
import '../../../shared/bottom_navigation.dart';
import '../../../shared/side_menu.dart';


class newOrderMultipleForm extends StatefulWidget {
  const newOrderMultipleForm({Key? key}) : super(key: key);

  @override
  State<newOrderMultipleForm> createState() => _newOrderMultipleFormState();
}

class _newOrderMultipleFormState extends State<newOrderMultipleForm> {
  final _scaffoldNewOrderKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldNewOrderKey,
      drawer: SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldNewOrderKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          'New Order',
          style: TextStyle(
            color: Style.textColorDark,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Style.blueAccentPageBackgroundColor, Style.blueAccentPageBackgroundColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body:SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Style.paddingHeight / 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _getStepper()
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class _getStepper extends StatefulWidget {
  const _getStepper({Key? key}) : super(key: key);

  @override
  State<_getStepper> createState() => _getStepperState();
}

class _getStepperState extends State<_getStepper> {
  int currentStep = 0;
  List<Step> getSteps() => [
    Step(
      title: Text(''),
      content: addOrderDetails(),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: Text(''),
      content: AddOrderDimension(),
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: Text(''),
      content: viewOrderList(),
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stepper(
      elevation: 0.0,
      physics: const BouncingScrollPhysics(),
      type: StepperType.horizontal,
      steps: getSteps(),
      currentStep: currentStep,
      onStepContinue: () {
        final isLastStep = currentStep == getSteps().length -1;
        setState(() {
          if(!isLastStep){
            currentStep += 1;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if(currentStep > 0){
            currentStep -= 1;
          }
        });
      },
      onStepTapped: (int index) {
        setState(() {
          currentStep = index;
        });
      },
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        final isLastStep = currentStep == getSteps().length -1;
        return Container(
          margin: EdgeInsets.only(top: Style.paddingHeight),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  child: Text('BACK'),
                  onPressed: details.onStepCancel,
                ),
              ),
              SizedBox(
                width: Style.paddingHeight / 3,
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                  onPressed: details.onStepContinue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


