import 'package:flutter/material.dart';

class RomanConversion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RomanConversionState();
  }
}

class _RomanConversionState extends State<RomanConversion> {
  int _cIndex = 0;

  String _roman = "";
  String _romanErr = "";
  String _dec = "";
  String _decErr = "";
  double deviceHeight;
  double deviceWidth;

  final myDecController = new TextEditingController();
  final myRomanController = new TextEditingController();

  // **************************************************************** //
  // Helper functions.
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget paddingEdgeInsetsTop(var number) {
    return new Padding(
      padding: EdgeInsets.only(top: number),
    );
  }

  // **************************************************************** //
  // Action functions.
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  void submitConvertNumber(BuildContext context) {
    setState(() {
      var theNum = myDecController.text;
      if (theNum.length == 0) {
        _roman = "Enter a Number.";
      } else if (int.tryParse(theNum) >= 4000) {
        _romanErr = "The number must be less than 4000.";
      } else {
        var aa = "Something";
        _roman = "$aa";
      }
    });
  }

  void submitClearNumber(BuildContext context) {
    setState(() {
      myDecController.text = "";
      _romanErr = "";
      _roman = "";
    });
  }

  void submitConvertRoman(BuildContext context) {
    setState(() {
      var theNum = myRomanController.text;
      var aa = 66;

      if (theNum.length == 0) {
        _dec = "Enter a Roman Numeral.";
      } else if (aa > 3999) {
        _decErr = "Should be less than (4000) MMMM.";
      } else {
        _dec = "$aa";
      }
    });
  }

  void submitClearRoman(BuildContext context) {
    setState(() {
      myRomanController.text = "";
      _decErr = "";
      _dec = "";
    });
  }

  // **************************************************************** //
  // Convert decimal Number area.
  Widget textboxDecimalEntryArea() {
    return new Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new TextField(
        // textInputAction: TextInputAction.go,
        decoration: new InputDecoration(
          labelText: "Enter a decimal number",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        controller: myDecController,
        onChanged: (v) => setState(() {
              //_roman = v;
            }),
        keyboardType: TextInputType.number,
        style: new TextStyle(fontFamily: "Arvo"),
      ),
    );
  }

  Widget conversionDecimalResultAreaError() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: new Text(
        _romanErr,
        style: TextStyle(
          fontSize: 15,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget conversionDecimalResultAreaText() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: new Text(
        "Roman Value: ",
        style: TextStyle(
          fontSize: 25,
          color: hexToColor("#F2A03D"),
        ),
      ),
    );
  }

  Widget conversionDecimalResultAreaResult() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Text(
        _roman,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.redAccent,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  Widget convertDecimalButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitConvertNumber(context),
            color: Colors.lightGreen,
            child: Text(
              'Convert',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
          );
        },
      ),
    );
  }

  Widget clearDecimalButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitClearNumber(context),
            color: Colors.lightBlueAccent,
            child: Text(
              'Clear',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
          );
        },
      ),
    );
  }

  Widget decimalButtonArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        convertDecimalButton(),
        clearDecimalButton(),
      ],
    );
  }

  // **************************************************************** //
  // Convert Roman Numeral area.
  Widget textboxRomanEntryArea() {
    return new Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new TextField(
        // textInputAction: TextInputAction.go,
        decoration: new InputDecoration(
          labelText: "Enter a roman numeral",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        controller: myRomanController,
        onChanged: (v) => setState(() {
              //_roman = v;
            }),
        keyboardType: TextInputType.number,
        style: new TextStyle(fontFamily: "Arvo"),
      ),
    );
  }

  Widget conversionRomanResultAreaError() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: new Text(
        _decErr,
        style: TextStyle(
          fontSize: 15,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget conversionRomanResultAreaText() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: new Text(
        "Decimal Value: ",
        style: TextStyle(
          fontSize: 25,
          color: hexToColor("#F2A03D"),
        ),
      ),
    );
  }

  Widget conversionRomanResultAreaResult() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Text(
        _dec,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget convertRomanButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitConvertRoman(context),
            color: Colors.lightGreen,
            child: Text(
              'Convert',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
          );
        },
      ),
    );
  }

  Widget clearRomanButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            onPressed: () => submitClearRoman(context),
            color: Colors.lightBlueAccent,
            child: Text(
              'Clear',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
          );
        },
      ),
    );
  }

  Widget romanButtonArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        convertRomanButton(),
        clearRomanButton(),
      ],
    );
  }

  // **************************************************************** //
  // The Card setup areas.
  Widget createDecimalConversionArea(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 25.0,
          child: new Container(
            child: Container(
              child: new Column(
                children: [
                  paddingEdgeInsetsTop(10.0),
                  new Text(
                    'Convert Decimal Number',
                    style: new TextStyle(
                        color: hexToColor("#F2A03D"), fontSize: 25.0),
                  ),
                  paddingEdgeInsetsTop(5.0),
                  textboxDecimalEntryArea(),
                  conversionDecimalResultAreaError(),
                  conversionDecimalResultAreaText(),
                  conversionDecimalResultAreaResult(),
                  decimalButtonArea(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createRomanConversionArea(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 25.0,
          child: new Container(
            child: Container(
              child: new Column(
                children: [
                  paddingEdgeInsetsTop(10.0),
                  new Text(
                    'Convert Roman Numeral',
                    style: new TextStyle(
                        color: hexToColor("#F2A03D"), fontSize: 25.0),
                  ),
                  paddingEdgeInsetsTop(5.0),
                  textboxRomanEntryArea(),
                  conversionRomanResultAreaError(),
                  conversionRomanResultAreaText(),
                  conversionRomanResultAreaResult(),
                  romanButtonArea(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // **************************************************************** //
  // Screen creation area.
  Widget createAppBar() {
    return AppBar(
      title: Text("Roman Numeral Conversion"),
    );
  }

  Widget createBody(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: ListView(
        children: <Widget>[
          createDecimalConversionArea(context),
          createRomanConversionArea(context)
        ],
      ),
    );
  }

  Widget createBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _cIndex,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.indigo,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.indigo,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.indigo,
        ),
      ],
      onTap: (index) {
        _incrementTab(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: createAppBar(),
      body: createBody(context),
      // bottomNavigationBar: createBottomNavBar(context),
    );
  }
}
