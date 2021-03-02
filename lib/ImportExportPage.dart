import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ImportExportPage extends StatefulWidget {
  @override
  _ImportExportPageState createState() => _ImportExportPageState();
}

class _ImportExportPageState extends State<ImportExportPage> {
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
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 3, 5),
                              maxTime: DateTime(2099, 6, 7),
                              onChanged: (date)
                              {
                                print('change $date');
                              },
                              onConfirm: (date)
                              {
                                print('confirm $date');
                              }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        child: Text(
                          'Select Date',
                          style: TextStyle(color: Colors.blue,fontSize: 16.0),
                        )
                    ),
                    Text(
                        'Date: 02/02/2021',
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
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 3, 5),
                            maxTime: DateTime(2099, 6, 7),
                            onChanged: (date)
                            {
                              print('change $date');
                            },
                            onConfirm: (date)
                            {
                              print('confirm $date');
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        'Select Date',
                        style: TextStyle(color: Colors.blue,fontSize: 16.0),
                      )
                  ),
                  Text(
                      'Date: 02/03/2021',
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
