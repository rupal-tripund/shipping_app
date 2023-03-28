import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import 'package:input_quantity/input_quantity.dart';

int _nItem = 0;
final _formKey = GlobalKey<FormState>();
class Item{
  String header;
  Widget body;
  bool isExpanded;
  Item(this.header, this.body, this.isExpanded);
}

class AddOrderDetails extends StatelessWidget {
  const AddOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nItem = 5;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: PanelWidget(),
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width < 450
                            ? Style.paddingHeight : Style.paddingHeight * 3,
                        vertical: MediaQuery.of(context).size.width < 450
                            ? Style.paddingHeight : Style.paddingHeight * 3,
                      ),
                      child: ButtonWidget(),
                    ),
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

class PanelWidget extends StatefulWidget {
  const PanelWidget({Key? key}) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final List<Item> _data = <Item>[
    Item("Order description", getOrderDescriptionTextFields(), false),
    Item("Order dimensions", getOrderDimension(), false),
    Item("Upload order document", getUploadDocuments(), false),
    Item("Photograph order document", getPhotographOrderDocument(), false),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) => {
          setState(() => {
            _data[index].isExpanded = !isExpanded,
          }),
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item.header,
                  style: TextStyle(
                    fontSize: Style.sizeSubTitle * 1.3,
                    fontWeight: FontWeight.w300,
                    color: Style.textColorLight,
                  ),
                ),
              );
            },
            body: Column(
              children: [
                item.body,
              ],
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if(_formKey.currentState!.validate()){

          }
        });
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
                'Next',
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
    );
  }
}

class getOrderDescriptionTextFields extends StatefulWidget {
  const getOrderDescriptionTextFields({Key? key}) : super(key: key);
  @override
  State<getOrderDescriptionTextFields> createState() => _getOrderDescriptionTextFieldsState();
}

class _getOrderDescriptionTextFieldsState extends State<getOrderDescriptionTextFields> {
  List<TextEditingController> descriptionControllers = [];
  List<Container> descriptionTextFields = [];

   void createControllers() {
     for (var i = 0; i < _nItem; i++) {
       descriptionControllers.add(TextEditingController());
     }
     createTextFields();
   }

   void disposeControllersAndTextFields(){
     for (var i = 0; i < _nItem; i++) {
       descriptionControllers[i].dispose();
     }
     descriptionControllers = [];
     descriptionTextFields = [];
   }

   void createTextFields(){
     for (var i = 0; i < _nItem; i++) {
       descriptionTextFields.add(
         Container(
           margin: EdgeInsets.symmetric(
             horizontal: 0,
             vertical: Style.paddingHeight / 5,
           ),
           child: TextFormField(
             controller: descriptionControllers[i],
             decoration: InputDecoration(
             prefixIcon: const Icon(Icons.description),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(13.0),
             ),
             enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(13.0),
               borderSide: const BorderSide(color: Colors.black54, width: 2.0),
             ),
             hintText: 'Enter order description for item '+(i+1).toString(),
             ),
             validator: (value){
               if(value!.isEmpty) {
                 return 'This field is required';
               }else{
                 return null;
               }
             },
           ),
         ),
       );
     }
   }

  @override
  void initState() {
    super.initState();
    createControllers();
  }
  @override
  void dispose() {
    super.dispose();
    disposeControllersAndTextFields();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
        vertical: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
      ),
      child: Column(
        children: <Widget>[
          for (var field in descriptionTextFields) field,
        ],
      ),
    );
  }
}

class getOrderDimension extends StatefulWidget {
  const getOrderDimension({Key? key}) : super(key: key);

  @override
  State<getOrderDimension> createState() => _getOrderDimensionState();
}

class _getOrderDimensionState extends State<getOrderDimension> {
  // get data from create new order page.
  final List<String> _productNames = <String>[
    "Macbook M1",
    "Dell inspiron 15",
    "Honor play",
    "Mango box",
  ];
  final List<double> _productQuantity = <double>[0,0,0,0];
  List<TextEditingController> dimensionLengthControllers = [];
  List<TextEditingController> dimensionWidthControllers = [];
  List<TextEditingController> dimensionHeightControllers = [];
  List<Container> dimensionTextFields = [];

  void createControllers() {
    for (var i = 0; i < _productNames.length; i++) {
      dimensionLengthControllers.add(TextEditingController());
      dimensionWidthControllers.add(TextEditingController());
      dimensionHeightControllers.add(TextEditingController());
    }
    createFields();
  }

  void setQuantity(double value, int index){
    _productQuantity[index] = value;
  }

  void createFields(){
    for (var i = 0; i < _productNames.length; i++) {
      dimensionTextFields.add(
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: Style.paddingHeight / 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Product name is "+_productNames[i].toLowerCase(),
                style: TextStyle(
                  fontSize: Style.sizeButtonText / 1,
                  fontWeight: FontWeight.w300,
                  color: Style.textColorLight,
                ),
              ),
              SizedBox(
                height:  Style.paddingHeight / 3,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Quantity ",
                    style: TextStyle(
                      fontSize: Style.sizeButtonText / 1,
                      fontWeight: FontWeight.w300,
                      color: Style.textColorLight,
                    ),
                  ),

                  InputQty(
                    maxVal: 100.0,
                    initVal: _productQuantity[i],
                    minVal: 0.0,
                    borderShape: BorderShapeBtn.square,
                    boxDecoration: BoxDecoration(),
                    minusBtn: Icon(
                      Icons.minimize,
                      size: Style.sizeButtonText / 1,
                    ),
                    plusBtn: Icon(
                      Icons.add,
                      size: Style.sizeButtonText / 1,
                    ),
                    btnColor1: Colors.blueAccent,
                    btnColor2: Colors.blueAccent,
                    onQtyChanged: (val) {
                      double value = val as double;
                      setQuantity(value , i);
                    },
                  ),
                ],
              ),

              SizedBox(
                height:  Style.paddingHeight / 3,
              ),
              TextFormField(
                controller: dimensionLengthControllers[i],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                  ),
                  hintText: 'Enter order length',
                ),
                validator: (value){
                  if(value!.isEmpty) {
                    return 'This field is required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(
                height:  Style.paddingHeight / 3,
              ),
              TextFormField(
                controller: dimensionWidthControllers[i],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                  ),
                  hintText: 'Enter order width',
                ),
                validator: (value){
                  if(value!.isEmpty) {
                    return 'This field is required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(
                height:  Style.paddingHeight / 3,
              ),
              TextFormField(
                controller: dimensionHeightControllers[i],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                  ),
                  hintText: 'Enter order height',
                ),
                validator: (value){
                  if(value!.isEmpty) {
                    return 'This field is required';
                  }else{
                    return null;
                  }
                },
              ),

              SizedBox(
                height:  Style.paddingHeight,
              ),

            ],
          )
        ),
      );
    }
  }

  void disposeControllersAndTextFields(){
    for (var i = 0; i < _productNames.length; i++) {
      dimensionLengthControllers[i].dispose();
      dimensionWidthControllers[i].dispose();
      dimensionHeightControllers[i].dispose();
    }
    dimensionLengthControllers = [];
    dimensionWidthControllers = [];
    dimensionTextFields = [];
  }

  @override
  void initState() {
    super.initState();
    createControllers();
  }
  @override
  void dispose() {
    super.dispose();
    disposeControllersAndTextFields();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
        vertical: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          for (var field in dimensionTextFields) field,
        ],
      ),
    );
  }
}

class getUploadDocuments extends StatefulWidget {
  const getUploadDocuments({Key? key}) : super(key: key);

  @override
  State<getUploadDocuments> createState() => _getUploadDocumentsState();
}

class _getUploadDocumentsState extends State<getUploadDocuments> {

  List<PlatformFile> _files = <PlatformFile>[];
  List<Container>  _fileNames = [];

  void displayFiles(List<PlatformFile> files) {
    _fileNames = [];
    for (var i = 0; i < files.length; i++) {
      _fileNames.add(
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: Style.paddingHeight / 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      files[i].name,
                      style: TextStyle(
                        fontSize: Style.sizeButtonText / 1,
                        fontWeight: FontWeight.w300,
                        color: Style.textColorLight,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          files.removeAt(i);
                          _fileNames.removeAt(i);
                          _files = files;
                          displayFiles(_files);
                        });
                      },
                      icon: Icon(Icons.delete),
                      iconSize: Style.sizeButtonText / 1,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      );
    }
  }



  @override
  void dispose() {
    super.dispose();
    _files = [];
    _fileNames = [];
  }

  @override
  void initState() {
    super.initState();
    _files = [];
    _fileNames = [];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
        vertical: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async{
              final result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc'],
              );
              if(result == null) return;
              _files = [];
              _files = result.files;
              setState(() {
                displayFiles(_files);
              });
            },
            child: Text(
              "Upload File",
              style: TextStyle(
                fontSize: Style.sizeButtonText,
                fontWeight: FontWeight.bold,
                color: Style.textColorDark,
              ),
            ),
          ),

          SizedBox(
            height: Style.paddingHeight,
          ),

          for (var name in _fileNames) name,

        ],
      ),
    );
  }
}



class getPhotographOrderDocument extends StatefulWidget {
  const getPhotographOrderDocument({Key? key}) : super(key: key);

  @override
  State<getPhotographOrderDocument> createState() => _getPhotographOrderDocumentState();
}

class _getPhotographOrderDocumentState extends State<getPhotographOrderDocument> {
  List<PlatformFile> _files = <PlatformFile>[];
  List<Container>  _fileNames = [];

  void displayFiles(List<PlatformFile> files) {
    _fileNames = [];
    for (var i = 0; i < files.length; i++) {
      _fileNames.add(
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: Style.paddingHeight / 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      files[i].name,
                      style: TextStyle(
                        fontSize: Style.sizeButtonText / 1,
                        fontWeight: FontWeight.w300,
                        color: Style.textColorLight,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          files.removeAt(i);
                          _fileNames.removeAt(i);
                          _files = files;
                          displayFiles(_files);
                        });
                      },
                      icon: Icon(Icons.delete),
                      iconSize: Style.sizeButtonText / 1,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      );
    }
  }



  @override
  void dispose() {
    super.dispose();
    _files = [];
    _fileNames = [];
  }

  @override
  void initState() {
    super.initState();
    _files = [];
    _fileNames = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
        vertical: MediaQuery.of(context).size.width < 450
            ? Style.paddingHeight : Style.paddingHeight * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async{
              final result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: ['jpg', 'img', 'jpeg', 'png'],
              );
              if(result == null) return;
              _files = [];
              _files = result.files;
              setState(() {
                displayFiles(_files);
              });
            },
            child: Text(
              "Upload File",
              style: TextStyle(
                fontSize: Style.sizeButtonText,
                fontWeight: FontWeight.bold,
                color: Style.textColorDark,
              ),
            ),
          ),

          SizedBox(
            height: Style.paddingHeight,
          ),

          for (var name in _fileNames) name,

        ],
      ),
    );
  }
}



