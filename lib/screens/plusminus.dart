import 'package:bloccode/helper/plusminusbloc.dart';
import 'package:flutter/material.dart';

class PlusMinus extends StatefulWidget {
  @override
  _PlusMinusState createState() => _PlusMinusState();
}

class _PlusMinusState extends State<PlusMinus> {
  PlusMinusBloc _bloc = PlusMinusBloc();
  int value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.addInSink(value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: _bloc.outputStream,
                builder: (BuildContext ctx, AsyncSnapshot snapShot){
                  if(snapShot.hasData){
                    value = snapShot.data;
                    return Text('Value is ${snapShot.data}', style: TextStyle(fontSize: 22),);
                  }
                  if(snapShot.hasError){
                    return Text('Some Error Occurs');
                  }
                  return Text('No Data');
                },
              ),
              RaisedButton(
                child: Text(
                  'Plus',
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: (){
                  _bloc.addInSink(value);
                },
              ),
              RaisedButton(
                child: Text(
                  'Minus',
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: (){
                  _bloc.subtractInSink(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
