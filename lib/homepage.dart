import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int count=0;
    StreamController<int> counterController =  StreamController<int>();

    Stream? myStream;

    @override
  void initState() {
    myStream = counterController.stream.asBroadcastStream();
    super.initState();
    
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: myStream,
                //stream: counterController.stream,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data.toString(), style: TextStyle(fontSize: 70),);
                  }
                  else{
                    return Text("0", style: TextStyle(fontSize: 70),);
                  }
                },
              ),

              StreamBuilder(
                stream: myStream,
                //stream: counterController.stream,  -> this stream is used for single stream
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data.toString(), style: TextStyle(fontSize: 70),);
                  }
                  else{
                    return Text("0", style: TextStyle(fontSize: 70),);
                  }
                },
              ),


            ],
          ),),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            counterController.sink.add(count);
          },
          child: Icon(Icons.add),),
      
    );
  }
}