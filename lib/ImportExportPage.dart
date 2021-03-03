import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ImportExportPage extends StatefulWidget {
  @override
  _ImportExportPageState createState() => _ImportExportPageState();
}

class _ImportExportPageState extends State<ImportExportPage> {

  DateTime selectedDateFrom = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDateFrom,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDateFrom)
      setState(() {
        selectedDateFrom = picked;
      });
  }

  DateTime selectedDateEnd = DateTime.now();
  _selectDateEnd(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDateEnd,
      firstDate: DateTime(2000,1,1),
      lastDate: DateTime(2099,12,31),
    );
    if (picked != null && picked != selectedDateEnd)
      setState(() {
        selectedDateEnd = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Export',
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        width: screenSize.width,
        child: Container(
          margin: EdgeInsets.all(screenSize.width*0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Data Range',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black
                ),
              ),
              SizedBox(height: screenSize.height*0.05,),
              Text(
                'From: ',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black
                ),
              ),
              Container(
                child: Row(
                  children: [
                    FlatButton(
                        onPressed: ()
                        {
                          _selectDate(context);
                        },
                        child: Text(
                          'Select Date',
                          style: TextStyle(color: Colors.blue,fontSize: 16.0),
                        )
                    ),
                    Text(
                        "${selectedDateFrom.toLocal()}".split(' ')[0],
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenSize.height*0.05,),
              Text(
                'To: ',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black
                ),
              ),
              Container(
              child: Row(
                children: [
                  FlatButton(
                      onPressed: ()
                      {
                        _selectDateEnd(context);
                      },
                      child: Text(
                        'Select Date',
                        style: TextStyle(color: Colors.blue,fontSize: 16.0),
                      )
                  ),
                  Text(
                    "${selectedDateEnd.toLocal()}".split(' ')[0],
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    ),
                  )
                ],
              ),
            ),
              SizedBox(height: screenSize.height*0.05,),
              GestureDetector(
                child: Container(
                  height: screenSize.height * 0.1,
                  width: screenSize.width,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Export',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
