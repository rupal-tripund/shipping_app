import 'package:flutter/material.dart';
import '../../constants/styles.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({Key? key}) : super(key: key);

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  final _formKey = GlobalKey<FormState>();
  String _status = "";
  List<String> _statusList = [
    "First stage",
    "Second Stage",
    "Third Stage",
  ];

  List<FocusNode> _nodes = [];
  List<Color> _colors = [];

  void _addDataInList(){
    for(int i = 0; i < 4; i++){
      _nodes.add(FocusNode());
      _colors.add(Style.defaultTextFieldIconColor);
    }
    _changeIconColor();
  }

  void _changeIconColor() {
    for(int i = 0; i < _nodes.length; i++){
      _nodes[i].addListener(() {
        setState(() {
          if(_colors[i] != Style.errorTextFieldIconColor){
            if(_nodes[i].hasFocus){
              _colors[i] = Style.blueAccentPageBackgroundColor;
            }else{
              _colors[i] = Style.defaultTextFieldIconColor;
            }
          }
        });
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _addDataInList();
  }

  @override
  void dispose() {
    super.dispose();
    for(int i = 0; i < _nodes.length; i++){
      _nodes[i].dispose();
    }
    _nodes = [];
    _colors = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.5,
                      child: ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          color: Colors.lightBlue,
                          width: double.infinity,
                          height: MediaQuery.of(context).orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height / 3 :
                              MediaQuery.of(context).size.height / (2 - 0.2),
                        ),
                      ),
                    ),
                    ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          color: Style.blueAccentPageBackgroundColor,
                          width: double.infinity,
                          height: MediaQuery.of(context).orientation == Orientation.portrait ?
                          MediaQuery.of(context).size.height / 3.2 :
                          MediaQuery.of(context).size.height / 2,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: Style.paddingHeight / 2.5,
                              vertical:Style.paddingWidth / 2.5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_circle_left_outlined),
                                      iconSize: Style.sizeIcon,
                                      color: Style.iconBackgroundColor,
                                      onPressed: () => {},
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Cancel Order',
                                      style: TextStyle(
                                        fontSize: Style.sizeTitle,
                                        fontWeight: FontWeight.bold,
                                        color: Style.textColorDark,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Cancel Order',
                                      style: TextStyle(
                                        fontSize: Style.sizeTitle / 1.1,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Style.primaryBackgroundColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight * 1.5 : Style.paddingHeight * 3.3,
                    vertical: MediaQuery.of(context).size.width < 450 ?
                    Style.paddingWidth * 1: Style.paddingWidth * 2,
                  ),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                focusNode: _nodes[0],
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.timelapse_outlined, color: _colors[0]),
                                  hintText: 'Please select status',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0)
                                  ),
                                ),
                                value: _status.isEmpty ? null : _status,
                                isDense: true,
                                isExpanded: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _status = newValue!;
                                  });
                                },
                                items: _statusList.map(
                                        (item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }
                                ).toList(),
                                validator: (value){
                                  if(value == null) {
                                    setState(() {
                                      _colors[0] = Style.errorTextFieldIconColor;
                                    });
                                    return 'This field is required';
                                  }else{
                                    setState(() {
                                      if(_nodes[0].hasFocus){
                                        _colors[0] = Style.blueAccentPageBackgroundColor;
                                      }else{
                                        _colors[0] = Style.defaultTextFieldIconColor;
                                      }
                                    });
                                    return null;
                                  }
                                },
                              ),
                            ),
                          SizedBox(
                            height: Style.paddingHeight / 1.5,
                          ),
                          TextFormField(
                            focusNode: _nodes[1],
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                                child: Icon(Icons.question_answer_outlined ,  color: _colors[1]),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                              ),
                              hintText: 'Please enter Reason',
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                setState(() {
                                  _colors[1] = Style.errorTextFieldIconColor;
                                });
                                return 'This field is required';
                              }else if(!RegExp(r'^[A-Z a-z\d]+$').hasMatch(value)) {
                                setState(() {
                                  _colors[1] = Style.errorTextFieldIconColor;
                                });
                                return 'Invalid input';
                              }else{
                                setState(() {
                                  if(_nodes[1].hasFocus){
                                    _colors[1] = Style.blueAccentPageBackgroundColor;
                                  }else{
                                    _colors[1] = Style.defaultTextFieldIconColor;
                                  }
                                });
                                return null;
                              }
                            },
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: Style.paddingHeight / 1.5,
                          ),
                          TextFormField(
                            focusNode: _nodes[2],
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.monetization_on_outlined ,  color: _colors[2]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                              ),
                              hintText: 'Please enter penalty',
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                setState(() {
                                  _colors[2] = Style.errorTextFieldIconColor;
                                });
                                return 'This field is required';
                              }else if(!RegExp(r'^\d+$').hasMatch(value)) {
                                setState(() {
                                  _colors[2] = Style.errorTextFieldIconColor;
                                });
                                return 'Invalid input';
                              }else{
                                setState(() {
                                  if(_nodes[2].hasFocus){
                                    _colors[2] = Style.blueAccentPageBackgroundColor;
                                  }else{
                                    _colors[2] = Style.defaultTextFieldIconColor;
                                  }
                                });
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: Style.paddingHeight / 1.5,
                          ),
                          TextFormField(
                            focusNode: _nodes[3],
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.currency_exchange,  color: _colors[3]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                              ),
                              hintText: 'Please enter refund amount',
                            ),
                            validator: (value){
                              if(value!.isEmpty) {
                                setState(() {
                                  _colors[3] = Style.errorTextFieldIconColor;
                                });
                                return 'This field is required';
                              }else if(!RegExp(r'^\d+$').hasMatch(value)) {
                                setState(() {
                                  _colors[3] = Style.errorTextFieldIconColor;
                                });
                                return 'Invalid input';
                              }else{
                                setState(() {
                                  if(_nodes[3].hasFocus){
                                    _colors[3] = Style.blueAccentPageBackgroundColor;
                                  }else{
                                    _colors[3] = Style.defaultTextFieldIconColor;
                                  }
                                });
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: Style.paddingHeight * 1.5,
                          ),
                          InkWell(
                            onTap: () {
                              if(_formKey.currentState!.validate()){

                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Cancel order',
                                      style: TextStyle(
                                        fontSize: Style.sizeButtonText,
                                        fontWeight: FontWeight.bold,
                                        color: Style.textColorDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 32.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 3.23), size.height - 68.0);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
